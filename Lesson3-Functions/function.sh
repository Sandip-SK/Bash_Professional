#!/bin/bash
# This script demonstrates a reusable Bash function for monitoring disk usage.
# It checks whether the root filesystem exceeds a threshold and returns
# a status code that makes it easy to use in automation.

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

if check_disk 90; then
    echo "Healthy"
else
    echo "Problem detected"
fi

# Example usage:
# ./function.sh
# This will evaluate the current disk usage against 90%.