#!bin/bash
# Write a Bash script that accepts a disk usage threshold as a command-line argument.
threshold=$1
# Check if the threshold argument is provided
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