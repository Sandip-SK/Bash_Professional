# Production incident: Build a log-analysis script
# Hard
# An API is experiencing elevated errors. The interviewer asks you to write a reusable Bash script named analyze_logs.sh that accepts a log filename as its first argument.
# Each log line follows this format:
# IP METHOD PATH STATUS


# Example:
# 10.0.0.1 GET /health 200
# 10.0.0.2 GET /api 500
# 10.0.0.3 POST /payment 503
# 10.0.0.2 GET /login 502
# 10.0.0.4 GET /home 404


# Requirements
# 1. Check that a filename was provided.
# 2. Check that the file exists and is readable.
# 3. Print the total number of requests.
# 4. Print the number of 5xx responses.
# 5. Print the 5xx error rate to two decimal places.
# 6. Print the top 3 IP addresses generating 5xx responses, with the highest count first.
# 7. Handle an empty file safely.
# You may use awk, sort, head, and standard Bash constructs.