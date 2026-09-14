#!/bin/bash
# Command substitution allows the output of a command to replace the command itself.
# Command substitution occurs when a command is enclosed as follows:
# $(command) or `command`
# The output of the command is substituted in place of the command itself.
# Example:
current_date=$(date)
echo "Current date and time: $current_date"
HOSTNAME=$(hostname)
echo "Hostname: $HOSTNAME"
PODS=$(kubectl get pods --no-headers | wc -l)
echo "Number of pods: $PODS"