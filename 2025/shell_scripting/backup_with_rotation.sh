#!/bin/bash

# =========================================================== #
# Description:
#   Automated Backup & Recovery Script with Rotation
#   Creates timestamped backups and maintains last 3 versions
#
# Author: Soumo Sarkar
# =========================================================== #


# Validate input parameter
if [ $# -ne 1 ]; then
    echo "Usage: $0 <target-directory>"
    exit 1
fi


# Define the required variables
target_dir="${1%/}"   # remove trailing slash from the directory path
backup_prefix="backup"
timestamp=$(date +%Y-%m-%d_%H-%M-%S)
backup_dir="${target_dir}/${backup_prefix}_${timestamp}"


# Validate target directory exists
if [ ! -d "$target_dir" ]; then
    echo "Error: Target directory $target_dir does not exist"
    exit 1
fi


# Create backup directory
if ! mkdir -p "$backup_dir"; then
    echo "Error: Failed to create backup directory"
    exit 1
fi


# Copy files excluding existing backups
if rsync -a --exclude="${backup_prefix}_*" "$target_dir/" "$backup_dir"; then
    echo "Backup created: $backup_dir"
else
    echo "Error: Backup creation failed"
    exit 1
fi



# Rotate backups - keep last 3

# Get list of existing backups and sort them
backups=($(ls -d "${target_dir}/${backup_prefix}_"* 2> /dev/null | sort))
backup_count=${#backups[@]}


# Check if we have more than 3 backups
if [ "$backup_count" -gt 3 ]; then
    remove_count=$((backup_count - 3))
    echo -e "\nRotating backups - removing $remove_count old version(s)"

    # Loop through and remove the oldest backups
    for (( i=0; i<remove_count; i++ )); do
        echo "Removing: ${backups[$i]}"
        rm -rf "${backups[$i]}"
    done
fi


echo -e "\nBackup complete.\n\nCurrent backups:"
ls -d "${target_dir}/${backup_prefix}_"* 2> /dev/null | sort -r | xargs -n 1 basename
