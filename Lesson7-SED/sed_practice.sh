# Suppose you have:

# APP_ENV=development
# APP_PORT=8080
# APP_DEBUG=true

# The deployment script needs to change:

# APP_ENV=development

# to:

# APP_ENV=production

# without accidentally changing other occurrences of the word development.
sed 's/APP_ENV=development/APP_ENV=production/' config2.txt