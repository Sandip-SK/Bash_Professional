# Given this log:

# 10.0.0.1 500
# 10.0.0.2 503
# 10.0.0.1 500
# 10.0.0.3 500
# 10.0.0.2 503
# 10.0.0.1 500

# The interviewer asks:

# Find the IP that generated the most errors.

# Expected:

# 10.0.0.1 3

awk '$2 ~ /^5/ {print $1}' server.log | sort | uniq -c | sort -nr