# Imagine this configuration:

# APP_ENV=production
# APP_PORT=8080
# APP_DEBUG=true
# DB_HOST=db-prod.internal
# DB_PORT=5432

# An interviewer asks:

# Extract the value of DB_HOST.
grep '^DB_HOST=' config.txt | cut -d '=' -f 2

# using AWK
awk -F'=' '/^DB_HOST=/ {print $2}' config.txt

#awk command to extract DB_PORT
awk -F"=" '/^DB_PORT=/ {print $2}' config.txt
