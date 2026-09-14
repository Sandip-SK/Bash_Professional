# Match rows where the second field exactly equals "production".
# This is useful for filtering environment-specific entries.
awk '$2 == "production" {print $1}' servers3.txt