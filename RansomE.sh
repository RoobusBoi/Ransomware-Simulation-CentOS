#!/bin/bash

# Prompt user for the username to encrypt files
read -p "Please enter the username you want to encrypt files for: " input_username

# Change directory to the Desktop directory of the provided username
cd "/home/$input_username/Desktop" || { echo "Failed to change directory."; exit 1; }

# Perform operations in the user's Desktop directory
echo "Changed directory to: $PWD"

# Define the directory containing files to encrypt
directory_to_encrypt="$PWD"

# Loop through each file in the directory
for file_to_encrypt in "$directory_to_encrypt"/*; do
    if [ -f "$file_to_encrypt" ]; then
        # Encrypt each file using OpenSSL with a hardcoded passphrase
        openssl enc -aes-256-cbc -salt -in "$file_to_encrypt" -out "$file_to_encrypt.enc" -k MySecretPassphrase
        
        # Remove the original file after encryption (optional)
        rm "$file_to_encrypt"
        
        echo "File '$file_to_encrypt' encrypted as '$file_to_encrypt.enc' and the original file is removed."
    fi
done
