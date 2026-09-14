#!/bin/bash
# This script demonstrates how Bash receives arguments from the command line.
# $0 is the script name.
# $1, $2, $3 are the first, second, and third positional arguments.
# $# is the total number of arguments.
# "$@" expands to all arguments as separate items.

echo "Script name: $0"
echo "First argument: $1"
echo "Second argument: $2"
echo "Third argument: $3"
echo "Total arguments: $#"
echo "All arguments: $@"

# Example usage:
# ./command_line_argument.sh web01 web02 web03
# This will print each argument separately.