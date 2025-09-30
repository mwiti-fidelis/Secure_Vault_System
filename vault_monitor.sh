#!/bin/bash

Vault="$HOME/secure_vault"
Report_file="$Vault/vault_report.txt"

# Check if vault exists
if [ ! -d "$Vault" ]; then
    echo "Error: secure_vault directory not found!" >&2
    exit 1
fi

# Function to check if permission is more open than 644
is_more_open() {
    local perm="$1"
    # Convert to decimal for comparison
    local dec_perm=$((8#$perm))
    local dec_644=$((8#644))
    if [ $dec_perm -gt $dec_644 ]; then
        return 0  # true
    else
        return 1  # false
    fi
}

# Start report
> "$REPORT_FILE"
for file in "$Vault"/*; do
    filename=$(basename "$file")
    size=$(stat -c%s "$file")
    mtime=$(stat -c%y "$file")
    perms=$(stat -c%a "$file")

    echo "File name: $filename" >> "$REPORT_FILE"
    echo "Size in bytes: $size" >> "$REPORT_FILE"
    echo "Last modified: $mtime" >> "$REPORT_FILE"
    echo "Current permissions: $perms" >> "$REPORT_FILE"

    if is_more_open "$perms"; then
        echo "⚠️ SECURITY RISK DETECTED" >> "$REPORT_FILE"
    fi
    echo "---" >> "$REPORT_FILE"
done

echo "Vault report created at $REPORT_FILE"
