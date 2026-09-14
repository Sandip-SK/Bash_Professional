# This matches values beginning with:

# server

# Regex: ^server means: starts with server

# And:

# server$ means: ends with server
awk '$1 ~ /^server/' servers.txt

# 2026-09-14 10:01:23 INFO GET /api/users 200
# 2026-09-14 10:01:24 INFO GET /api/orders 200
# 2026-09-14 10:01:25 ERROR GET /api/payment 500
# 2026-09-14 10:01:26 ERROR GET /api/payment 500
# 2026-09-14 10:01:27 INFO GET /api/users 200
# 2026-09-14 10:01:28 ERROR GET /api/orders 503
# 2026-09-14 10:01:29 INFO GET /api/users 200

# To find 5xx:

# awk '$6 ~ /^5/ {print $0}' app.log

# Meaning:

# $6        → HTTP status
# ~         → matches
# ^5        → starts with 5

awk '$6 ~ /^5/ {print $0}' app.log