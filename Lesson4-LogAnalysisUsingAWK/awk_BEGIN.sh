# BEGIN runs before processing input.
# This example prints a title and then lists the first field from each line.
awk 'BEGIN {print "Server Report"} {print $1}' servers.txt