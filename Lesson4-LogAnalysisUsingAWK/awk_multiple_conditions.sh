# Match rows where the second column falls within a range.
awk '$2 > 80 && $2 < 95 {print $1}' servers2.txt

# Print entries that are either very high or very low.
awk '$2 > 95 || $2 < 20 {print $1}' servers.txt

# Print values within a defined threshold range.
awk '$2 >= 90 && $2 <= 95 {print $1}' servers.txt