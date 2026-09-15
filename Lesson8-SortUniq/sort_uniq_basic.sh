#sort
sort app.log

# sort remove duplicates
sort -u app.log

# Count duplicates
sort app.log | uniq -c

# Find most frequent
sort app.log | uniq -c | sort -nr