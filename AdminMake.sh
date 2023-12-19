#!/bin/bash


# Define the username for the new user and the password
new_username="RedTest"
new_password="red123"

# Add a new user with sudo privileges
echo "Creating a new user: $new_username"
useradd -m $new_username
usermod -aG wheel $new_username

# Set the hardcoded password for the new user
echo "Setting password for $new_username"
echo "$new_username:$new_password" | chpasswd

echo "New root user '$new_username' created with sudo privileges."

