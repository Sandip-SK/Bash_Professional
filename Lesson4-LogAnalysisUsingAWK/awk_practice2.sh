# This AWK script calculates the average CPU usage across all servers,
# but only prints the value if at least one server is above 90% usage.
# Example input:
# server1 45
# server2 91
# server3 72
# server4 95
# server5 88
#
# Output:
# Average CPU: 78.2%
awk '
{
    sum += $2

    if ($2 > 90)
        found=1
}
END {
    if (found)
        print "Average CPU:", sum/NR "%"
}' servers2.txt