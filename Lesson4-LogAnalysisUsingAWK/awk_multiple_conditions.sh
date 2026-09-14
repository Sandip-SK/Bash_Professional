awk '$2 > 80 && $2 < 95 {print $1}' servers2.txt

awk '$2 > 95 || $2 < 20 {print $1}' servers.txt

awk '$2 >= 90 && $2 <= 95 {print $1}' servers.txt