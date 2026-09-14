# Count occurrences by the sixth field in the log.
# This is useful for grouping by status codes or service states.
awk '{count[$6]++} END {for (status in count) print status, count[status]}' example1.log