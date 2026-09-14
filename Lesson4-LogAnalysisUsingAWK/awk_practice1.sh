# Print only the names of servers whose CPU usage is greater than 90%.
awk '$2 > 90 {print $1}' servers2.txt

# Print the server name and usage percentage in a readable format.
# Example output:
# server2 91%
# server4 95%
awk '$2 > 90 {print $1 " "$2"%"}' servers2.txt