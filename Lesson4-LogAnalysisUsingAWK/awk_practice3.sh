# Given an application log:

# 2026-09-14 10:01:23 INFO GET /api/users 200
# 2026-09-14 10:01:24 INFO GET /api/orders 200
# 2026-09-14 10:01:25 ERROR GET /api/payment 500
# 2026-09-14 10:01:26 ERROR GET /api/payment 500
# 2026-09-14 10:01:27 INFO GET /api/users 200
# 2026-09-14 10:01:28 ERROR GET /api/orders 503
# 2026-09-14 10:01:29 INFO GET /api/users 200
# Interview question:

# Find the total number of 5xx responses AND print an alert if there are more than 2.

# Expected:

# 5xx errors: 3
# ALERT: High number of 5xx errors

awk '
{
    if ($6 ~ /^5/) {
        count++
    }
}
END {
    print "5xx errors:", count

    if (count > 2) {
        print "ALERT: High number of 5xx errors"
    }
}
' app.log