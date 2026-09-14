#!/bin/bash
# Command substitution captures the output of a command and uses it as data.
# Syntax:
#   $(command)
#   `command`  (older style, still valid but less common)

current_date=$(date)
echo "Current date and time: $current_date"

HOSTNAME=$(hostname)
echo "Hostname: $HOSTNAME"

# Example from Kubernetes operations:
# This counts the number of running pods in the current cluster context.
PODS=$(kubectl get pods --no-headers 2>/dev/null | wc -l)
echo "Number of pods: $PODS"

# This pattern is useful in SRE scripts for collecting runtime values dynamically.