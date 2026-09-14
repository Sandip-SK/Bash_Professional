# Suppose we want servers whose usage is greater than 90.
awk '$2 > 90 {print $1}' servers.txt