# Suppose you have:

# 10.0.0.1 GET /api/users 200
# 10.0.0.2 GET /api/orders 500
# 10.0.0.1 GET /api/payment 500
# 10.0.0.3 GET /api/users 200
# 10.0.0.2 GET /api/payment 500
# 10.0.0.1 GET /api/orders 500

# The interviewer asks:

# Find the IP addresses that generated HTTP 500 errors.

# Expected:

# 10.0.0.2
# 10.0.0.1
# Challenge

# Use:

# grep
# awk
awk '$4 == 500 {print $1}' app.log | sort -u

awk '$4 ~ /^5/ {print $1}' app.log | sort | uniq