#!/bin/bash

# Generate a random password with the given length and options
# Usage: ./generate_password.sh [-l length] [-s] [-n] [-c] [-h]

# Default values for password options
length=16
include_special=false
include_numbers=false
include_capitals=false

# Define command line options using getopts
while getopts "l:snch" opt; do
  case $opt in
    l)
      length=$OPTARG
      ;;
    s)
      include_special=true
      ;;
    n)
      include_numbers=true
      ;;
    c)
      include_capitals=true
      ;;
    h)
      echo "Usage: ./generate_password.sh [-l length] [-s] [-n] [-c] [-h]"
      echo "  -l: Specify length of password (default: 16)"
      echo "  -s: Include special characters in password"
      echo "  -n: Include numbers in password"
      echo "  -c: Include capital letters in password"
      echo "  -h: Show help message"
      exit 0
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

# Define the characters to use in the password based on options
chars="abcdefghijklmnopqrstuvwxyz"
if $include_capitals; then
  chars+="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
fi
if $include_numbers; then
  chars+="0123456789"
fi
if $include_special; then
  chars+="@#%^&*()_-+="
fi

# Generate the password using /dev/urandom and base64 encoding
password=$(head /dev/urandom | tr -dc "$chars" | head -c "$length" | base64)

# Print the password to the console
echo "$password"
