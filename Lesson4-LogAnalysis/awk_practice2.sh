# You have:

# server1 45
# server2 91
# server3 72
# server4 95
# server5 88

# The interviewer asks:

# Calculate the average CPU usage of all servers, but only report the average if at least one server has CPU usage above 90%.

# For this input:

# server2 → 91
# server4 → 95

# There are servers above 90, so print the average:

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