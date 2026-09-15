awk '{print $1}' server2.log | sort | uniq -c | sort -nr | head -1 | awk '{print $2}'

awk '{count[$1]++} END {for (ip in count) print count[ip], ip}' server2.log | sort -nr | head -1