# Basic grep examples for log analysis.
# Search for lines ending in 500, often used for HTTP errors.
grep " 500$" app.log

# Search for ERROR entries.
grep "ERROR" app.log

# Case-insensitive search.
grep -i "error" app.log

# Show line numbers for matches.
grep -n "ERROR" app.log

# Count how many error lines appear.
grep "ERROR" app.log | wc -l
grep -c "ERROR" app.log

# Invert the match and show everything except INFO lines.
grep -v "INFO" app.log

# These patterns are commonly used during incident triage and log investigation.
