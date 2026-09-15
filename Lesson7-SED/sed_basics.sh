# s / old / new /
# This:

# sed 's/development/production/' config.txt

# prints the modified content to stdout.

# The original file remains unchanged.
sed 's/development/production/' config.txt

# To modify the file directly:
sed -i 's/development/production/' config.txt

# To replace all:
sed 's/server1/server2/g' file

