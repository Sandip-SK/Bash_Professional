#!/bin/bash
# This script checks multiple servers passed as command-line arguments.
# For each server, it prints the status and marks it as UP or DOWN.
# This is a common operational pattern used for quick health validation.

for server in "$@"; do
    echo "Checking $server..."

    if ping -c 1 "$server" &>/dev/null; then
        echo "$server: UP"
    else
        echo "$server: DOWN"
    fi
done

# Example usage:
# ./for_loop.sh web01 web02 google.com