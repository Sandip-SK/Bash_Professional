# Your application log contains:

# INFO Request received
# INFO Validating request
# WARN Connection pool almost full
# ERROR Database connection timeout
# INFO Retrying database connection
# INFO Database connection successful
# ERROR Database connection timeout
# WARN Connection pool almost full

# The interviewer asks:

# Find all ERROR lines and show 1 line of context before and after each error.
grep -C 1 "ERROR" app2.log