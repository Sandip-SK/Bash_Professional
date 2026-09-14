# Write a function:

# check_disk()

# that:

# Gets the disk usage of /
# Accepts a threshold as an argument
# Prints WARNING if usage exceeds the threshold
# Prints OK otherwise
# Returns exit code:
# 0 → disk healthy
# 1 → disk usage exceeded threshold

# Then call it:

# check_disk 90
#!/bin/bash

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