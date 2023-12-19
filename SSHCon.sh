#!/bin/bash

# Check if script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Set root password
echo "Setting root password..."
echo "red123" | passwd --stdin root

# Ensure permissions on important directories
echo "Ensuring permissions..."
chmod 700 /root

echo "Root user setup complete."

pwd
wget http://192.168.137.253:8000/Main.sh
