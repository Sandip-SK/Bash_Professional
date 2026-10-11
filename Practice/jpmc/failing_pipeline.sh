# Diagnose a failing pipeline
# An application log analyzer contains:
# #!/usr/bin/env bash
# set -euo pipefail

# grep "ERROR" app.log | awk '{count++} END {print count}'
# echo "Analysis completed"


# During a production incident, the log file exists but contains no ERROR entries. The script prints nothing from the expected count and exits before printing Analysis completed.
# Answer these three questions as if you're in the interview:
# 1. Why does the script exit early when there are no matching errors?
# 2. What is the difference between the exit codes of grep when it finds no matches versus when the file cannot be read?
# 3. How would you modify the script so that zero matches is a valid result, but a genuine file-reading error still causes the script to fail?
# Hint: Think about grep exit codes 0, 1, and 2, and how pipefail changes pipeline behavior.
# 1. The script exits early when there are no matching errors because of the `set -e` option in the bash script. This option causes the script to exit immediately if any command returns a non-zero exit status. In this case, when `grep` finds no matches, it returns an exit code of 1, which is considered a failure by the `set -e` option, leading to the script exiting before reaching the `echo "Analysis completed"` line.
# 2. The difference between the exit codes of `grep` when it finds no matches versus when the file cannot be read is as follows:
#    - Exit code 0: `grep` found matches (success).
#    - Exit code 1: `grep` found no matches (not an error, but indicates no results).
#    - Exit code 2: `grep` encountered an error (e.g., the file cannot be read, or there is a syntax error in the command).
# 3. To modify the script so that zero matches is a valid result, but a genuine file-reading error still causes the script to fail, you can change the `set -e` option to `set -eo pipefail` and handle the exit code of `grep` explicitly. Here's how you can do it:


#!/usr/bin/env bash
set -euo pipefail

if matches=$(grep "ERROR" app.log); then
    printf '%s\n' "$matches" | awk 'END {print NR}'
else
    status=$?
    if [[ $status -eq 1 ]]; then
        echo 0
    else
        echo "Error reading log file" >&2
        exit "$status"
    fi
fi

echo "Analysis completed"