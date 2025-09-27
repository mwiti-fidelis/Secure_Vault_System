#!/bin/bash
Vault="$HOME/Secure_vault"
Files=("keys.txt" "secrets.txt" "logs.txt")
Defaultperm=("600" "640" "644")

if [ ! -d "$Vault" ]; then
	echo "Error: $Vault does not exist."
	exit 1
fi
update_perm()
local file="$1"
local default_perm="$2"
local file_path="$Vault/$file"


if [ ! -f "$file_path" ]; then 
	echo "Error: $file not found in vault."
	return 
fi 


echo "current permissions for $file:"
ls -l 

read -p "Do you want to update the permission? (y/n): " response

if [[ "$response" == [Yy]$ ]]; then
	while true; do 
	    read -p "Enter the new permission using numbers or
	   press enter for ($Defaultperm) " perm
   if [ -z "$perm"]; then 
	 chmod "$Defaultperm" "$file_path"
       break 
elif 
	chmod "$perm" "$file_path"
       break
else  
	echo "current $file kept"
   fi


for i in "$Files" ; do 
	update_perm "$Files" "$Defaultperm"
	echo "___"
done

ls -l "$Vault"

 


       





