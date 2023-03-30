# Password Generator

This is a simple bash script that generates a random password with customizable options. It uses `/dev/urandom` and base64 encoding to ensure randomness and security.

## Usage

To use this script, simply run it from the command line:

'''
./generate_password.sh
'''
By default, the script generates a 16-character password with lowercase letters only. However, you can customize the password generation using the following command line options:

- `-l`: Specify the length of the password (default: 16)
- `-s`: Include special characters in the password
- `-n`: Include numbers in the password
- `-c`: Include capital letters in the password
- `-h`: Show a help message

For example, to generate a 20-character password with special characters and numbers, you can run:

'''
./generate_password.sh -l 20 -s -n
'''
This script can be useful for generating random and secure passwords for various purposes, such as authentication systems or account creation workflows. Feel free to customize it further or integrate it into your own projects. 