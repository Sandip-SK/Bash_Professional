# Basic AWK examples for log parsing.
# Print the first column from a log file.
awk '{print $1}' awk1.log

# Print multiple columns.
awk '{print $1, $2, $3}' awk1.log

# Print the entire line.
awk '{print $0}' awk1.log