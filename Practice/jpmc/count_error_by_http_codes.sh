# Question 2 — Count errors by HTTP status
# Medium
# You have this access.log:
# 10.0.0.1 GET /health 200
# 10.0.0.2 GET /api 500
# 10.0.0.3 POST /payment 503
# 10.0.0.4 GET /home 404
# 10.0.0.5 GET /search 500
# 10.0.0.6 POST /checkout 503
# 10.0.0.7 GET /api 502
# 10.0.0.8 GET /health 200


# Your task: Write a Bash command or pipeline to count each HTTP 5xx status code and print the results in ascending order of status code, like this:
# 500 2
# 502 1
# 503 2


# Requirements:
# - Count only status codes from 500 to 599.
# - Print the status code followed by its count.
# - Sort by status code numerically in ascending order.

awk '$4 >= 500 && $4 <= 599 { count[$4]++ }
     END { for (code in count) print code, count[code] }' access.log |
sort -n