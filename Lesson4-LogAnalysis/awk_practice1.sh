# Write an awk command to print only the server names whose CPU usage is greater than 90
awk '$2 > 90 {print $1}' servers2.txt

# Write an awk command to print:

# server2 91%
# server4 95%
awk '$2 > 90 {print $1 " "$2"%"}' servers2.txt