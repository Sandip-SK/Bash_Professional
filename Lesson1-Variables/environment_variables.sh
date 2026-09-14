#!/bin/bash
# This script prints commonly used environment variables.
# Environment variables are available to the shell and child processes.
# They usually contain system and session configuration information.

echo "HOME: $HOME"
echo "PATH: $PATH"
echo "USER: $USER"
echo "SHELL: $SHELL"
echo "PWD: $PWD"
echo "LANG: $LANG"
echo "TERM: $TERM"

# Useful commands to inspect environment variables:
# env
# printenv
# set
# These help you view the full environment and shell configuration.