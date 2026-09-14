#!/bin/bash
# This script demonstrates how variables store user input.
# The value entered by the user is assigned to the variable 'name'.

read -p "Enter your name: " name

echo "Hello, $name!"
# The variable is expanded inside the string using $name.