# Find slow API requests
# Medium
# During a production incident, API latency increases significantly. Your access log uses this simplified format:
# ENDPOINT STATUS LATENCY_MS


# Example latency.log:
# /api/users 200 120
# /api/orders 200 850
# /api/payment 500 2100
# /api/users 200 150
# /api/orders 504 1800
# /api/payment 200 900
# /api/search 200 1400


# Your task: Write an awk command that prints requests whose latency is greater than 1,000 milliseconds, showing the endpoint, status, and latency.
# Expected output:
# /api/payment 500 2100
# /api/orders 504 1800
# /api/search 200 1400


# Follow-up challenge
# Once you've filtered the slow requests, the interviewer may ask you to calculate the average latency for each endpoint and identify which endpoint is slowest.

awk '$3 > 1000 {print $0}' latency.log

awk '
{
    sum[$1] += $3
    count[$1]++
}
END {
    for (endpoint in sum)
        printf "%s %.2f\n", endpoint, sum[endpoint] / count[endpoint]
}' latency.log |
sort -k2,2nr |
head -n 1