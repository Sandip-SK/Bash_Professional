# This AWK script counts 5xx HTTP responses in an application log.
# It prints the total number of server errors and raises an alert
# if the count exceeds 2, which is useful during incident triage.
#
# Example output:
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