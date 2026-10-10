# Find errors in a time window
# Medium–Hard
# A production application generates logs in this format:
# 2026-10-10 10:02:15 INFO request completed
# 2026-10-10 10:04:21 ERROR database timeout
# 2026-10-10 10:09:43 ERROR payment failed
# 2026-10-10 10:12:05 INFO health check passed
# 2026-10-10 10:15:00 ERROR connection refused
# 2026-10-10 10:17:30 ERROR request failed


# Your task: Write an awk command that prints only ERROR lines between 10:00:00 and 10:15:00 inclusive, on the date 2026-10-10.
# Expected output:
# 2026-10-10 10:04:21 ERROR database timeout
# 2026-10-10 10:09:43 ERROR payment failed
# 2026-10-10 10:15:00 ERROR connection refused


# Assume the timestamp is in the server's local time and the logs are consistently formatted.
# Hint: $1 is the date, $2 is the time, and $3 is the log level. Since the timestamps are consistently formatted, string comparisons can work for the time window.
awk '$1 == "2026-10-10" && $2 >= "10:00:00" && $2 <= "10:15:00" && $3 == "ERROR" {print $0}' logs.log