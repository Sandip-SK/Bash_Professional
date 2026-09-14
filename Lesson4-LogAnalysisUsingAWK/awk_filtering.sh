# Print the server names whose usage in column 2 is greater than 90.
# This is useful when checking overutilized machines or high-load services.
awk '$2 > 90 {print $1}' servers.txt