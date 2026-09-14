#!/bin/bash
# This script checks the root filesystem usage against a threshold value.
# Example usage:
# ./practice1.sh 80
# If usage exceeds 80%, a warning is printed.

threshold=$1

if [ -z "$threshold" ]; then
    echo "Usage: $0 <disk_usage_threshold>"
    exit 1
fi

disk_usage=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

if [ "$disk_usage" -gt "$threshold" ]; then
    echo "Warning: Disk usage is above the threshold of $threshold%. Current usage: $disk_usage%."
else
    echo "Disk usage is within the threshold. Current usage: $disk_usage%."
fi