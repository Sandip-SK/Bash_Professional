# Find the top 3 IPs generating 5xx errors
# Medium
# You are investigating a production incident. The access log contains millions of lines in this format:
# IP METHOD PATH STATUS


# Example:
# 10.0.0.1 GET /api 500
# 10.0.0.2 GET /payment 503
# 10.0.0.1 POST /checkout 502
# 10.0.0.3 GET /home 200
# 10.0.0.2 POST /payment 500
# 10.0.0.1 GET /users 503
# 10.0.0.4 GET /api 500


# Your task: Write a Bash command or pipeline that:
# 1. Counts only requests with status codes from 500 through 599.
# 2. Groups those errors by client IP address.
# 3. Prints the top 3 IPs with the highest error counts, highest count first.
# Expected output for the sample:
# 3 10.0.0.1
# 2 10.0.0.2
# 1 10.0.0.4


# Think about the order of operations: filter → extract IP → count → sort numerically → take the top 3.
awk '$4 >= 500 && $4 <= 599 {count[$1]++}
     END {for (ip in count) print count[ip], ip}' example.log |
sort -nr |
head -n 3
