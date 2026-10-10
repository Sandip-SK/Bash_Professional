# Calculate the HTTP 5xx error rate
# Medium
# A JPMC production API is showing increased errors. You need to calculate its overall HTTP 5xx error rate from access.log.
# Example:
# 10.0.0.1 GET /health 200
# 10.0.0.2 GET /api 500
# 10.0.0.3 POST /payment 503
# 10.0.0.4 GET /home 404
# 10.0.0.5 GET /search 200
# 10.0.0.6 POST /checkout 502
# 10.0.0.7 GET /api 500
# 10.0.0.8 GET /health 200


# Your task: Write an awk command or Bash pipeline that prints:
# Total requests: 8
# 5xx errors: 4
# Error rate: 50.00%


# Requirements:
# 1. Count all requests.
# 2. Count only status codes from 500 through 599.
# 3. Print the error rate to two decimal places.
# 4. Handle an empty file safely without dividing by zero.
awk '
{
    total++
    if ($4 >= 500 && $4 <= 599)
        errors++
}
END {
    printf "Total requests: %d\n", total
    printf "5xx errors: %d\n", errors

    if (total > 0)
        printf "Error rate: %.2f%%\n", (errors / total) * 100
    else
        print "Error rate: N/A (no requests)"
}' example2.log