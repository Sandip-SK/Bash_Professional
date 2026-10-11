# Detect an error spike per minute
# Hard · Production SRE
# A JPMC production API normally generates fewer than 10 errors per minute. You receive this application log:
# 2026-10-11 12:01:05 ERROR database timeout
# 2026-10-11 12:01:18 ERROR payment failed
# 2026-10-11 12:01:40 INFO request completed
# 2026-10-11 12:01:52 ERROR connection refused
# 2026-10-11 12:02:10 ERROR database timeout
# 2026-10-11 12:02:20 ERROR payment failed
# 2026-10-11 12:02:35 ERROR connection refused
# 2026-10-11 12:02:50 ERROR database timeout
# 2026-10-11 12:02:55 ERROR request failed


# Your task: Write an awk command that counts ERROR entries per minute and prints only minutes with more than 3 errors.
# Expected output:
# 2026-10-11 12:02 5


# Think about how to build a minute key from the date and timestamp, and how to print the grouped counts in the END block.
awk '
$3 == "ERROR" {
    minute = $1 " " substr($2, 1, 5)
    count[minute]++
}
END {
    for (minute in count)
        if (count[minute] > 3)
            print minute, count[minute]
}' app.log