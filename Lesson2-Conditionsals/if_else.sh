#!/bin/bash
# For numbers:

# -eq    equal
# -ne    not equal
# -gt    greater than
# -ge    greater than or equal
# -lt    less than
# -le    less than or equal
CPU_USAGE=75
if [ $CPU_USAGE -gt 80 ]; then
    echo "CPU usage is above 80%. Please check your system."
elif [ $CPU_USAGE -gt 50 ]; then
    echo "CPU usage is above 50%. Please monitor your system."
else
    echo "CPU usage is normal."
fi

# Check whether a file exists:
file_path="/path/to/file.txt"
if [ -f "$file_path" ]; then
    echo "File exists."
else
    echo "File does not exist."
fi

# Check if files is readable(-r), writable(-w), and executable(-x):
file_path="/path/to/file.txt"
if [ -r "$file_path" ]; then
    echo "File is readable."
else
    echo "File is not readable."
fi

if [ -w "$file_path" ]; then
    echo "File is writable."
else
    echo "File is not writable."
fi

if [ -x "$file_path" ]; then
    echo "File is executable."
else
    echo "File is not executable."
fi