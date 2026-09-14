# Write a Bash script that accepts multiple server names and checks each server.
# Modify it so that it:

# Prints Checking <server>...
# Uses ping to check whether the server is reachable
# Prints:
# UP if ping succeeds
# DOWN if ping fails
#!/bin/bash

for server in "$@"; do
    echo "Checking $server..."

    if ping -c 1 "$server" &>/dev/null; then
        echo "$server: UP"
    else
        echo "$server: DOWN"
    fi
done