# trap and cleanup during script failure
# Medium–Hard
# You're running an SRE diagnostic script that creates a temporary file containing filtered production logs:
# #!/usr/bin/env bash
# set -euo pipefail

# tmpfile=$(mktemp)

# grep "ERROR" app.log > "$tmpfile"

# python3 analyze.py "$tmpfile"

# rm -f "$tmpfile"
# echo "Analysis completed"


# Scenario: python3 analyze.py exits with status 1. Because set -e is enabled, the script exits immediately, leaving the temporary file behind.
# Answer these questions:
# 1. What is the purpose of Bash's trap command?
# 2. How would you ensure the temporary file is removed on both success and failure?
# 3. What is the difference between trapping EXIT and trapping INT or TERM?
# Write a corrected version of the script. You can use a cleanup function.

#!/usr/bin/env bash
set -euo pipefail

tmpfile=$(mktemp)

cleanup() {
    rm -f -- "$tmpfile"
}

trap cleanup EXIT

grep "ERROR" app.log > "$tmpfile"
python3 analyze.py "$tmpfile"

echo "Analysis completed"