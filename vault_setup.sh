#!/bin/bash
Vault="$HOME/secure_vault"

#Create secure_vault directory
mkdir -p "$Vault"

#Create files with welcome message
echo "Welcome to the keys vault" > "$Vault/keys.txt"
echo "Welcome to the secrets vault" > "$Vault/secrets.txt"
echo "Welcome to the logs vault" > "$Vault/logs.txt"

#Print a success message and list in long format
echo "Succesfully created secure vault."
ls -l
