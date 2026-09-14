#!/bin/bash
# This script performs a basic server health check.
# It validates disk usage, memory usage, and a critical service.
# This pattern is commonly used in SRE scripts before deployment or maintenance.

set -euo pipefail

overall_status=0

check_disk() {
    local threshold=$1
    local disk_usage=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

    if [ "$disk_usage" -gt "$threshold" ]; then
        echo "WARNING: Disk usage is above the threshold of $threshold%. Current usage: $disk_usage%."
        return 1
    else
        echo "OK: Disk usage is within the threshold. Current usage: $disk_usage%."
        return 0
    fi
}

check_memory() {
    local threshold=$1
    local memory_usage=$(free | awk '/Mem/ {printf("%.0f", $3/$2 * 100)}')

    if [ "$memory_usage" -gt "$threshold" ]; then
        echo "WARNING: Memory usage is above the threshold of $threshold%. Current usage: $memory_usage%."
        return 1
    else
        echo "OK: Memory usage is within the threshold. Current usage: $memory_usage%."
        return 0
    fi
}

check_service() {
    local service_name=$1

    if systemctl is-active --quiet "$service_name"; then
        echo "OK: Service '$service_name' is running."
        return 0
    else
        echo "WARNING: Service '$service_name' is not running."
        return 1
    fi
}

if ! check_disk 90; then
    overall_status=1
fi

if ! check_memory 90; then
    overall_status=1
fi

if ! check_service nginx; then
    overall_status=1
fi

exit "$overall_status"