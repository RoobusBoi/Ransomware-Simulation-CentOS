#!/bin/bash

# Prompt user for the username to encrypt files
read -p "Please enter the username you want to encrypt files for: " input_username

# Change directory to the Desktop directory of the provided username
cd "/home/$input_username/Desktop" || { echo "Failed to change directory."; exit 1; }

# Perform operations in the user's home directory
echo "Changed directory to: $PWD"

# Define the directory containing files to encrypt
encrypted_directory="$PWD"

# Loop through each encrypted file in the directory
for encrypted_file in "$encrypted_directory"/*; do
    if [ -f "$encrypted_file" ]; then
        # Decrypt each encrypted file using OpenSSL with the same hardcoded passphrase
        openssl enc -d -aes-256-cbc -in "$encrypted_file" -out "${encrypted_file%.enc}" -k MySecretPassphrase
        
        # Remove the encrypted file after decryption (optional)
        rm "$encrypted_file"
        
        echo "File '$encrypted_file' decrypted as '${encrypted_file%.enc}' and the encrypted file is removed."
    fi
done
