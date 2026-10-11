#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <logfile>" >&2
    exit 1
fi

filename=$1

if [[ ! -f "$filename" || ! -r "$filename" ]]; then
    echo "Error: File does not exist or is not readable." >&2
    exit 1
fi

awk '
{
    total++
    if ($4 >= 500 && $4 <= 599) {
        errors++
        ip_errors[$1]++
    }
}
END {
    printf "Total requests: %d\n", total
    printf "5xx responses: %d\n", errors

    if (total > 0)
        printf "5xx error rate: %.2f%%\n", errors / total * 100
    else
        print "5xx error rate: N/A (no requests)"
}' "$filename"

echo "Top 3 IP addresses generating 5xx responses:"

awk '$4 >= 500 && $4 <= 599 { count[$1]++ }
     END { for (ip in count) print count[ip], ip }' "$filename" |
    sort -k1,1nr