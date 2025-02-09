# Week 3 Challenge 2: Automated Backup & Recovery Script with Rotation

## Overview

This document explains a Bash script designed to automate the backup process for a target directory. The script creates timestamped backups and implements a rotation mechanism to retain only the last 3 backups. This is a practical solution for maintaining disk space and keeping recent backup snapshots.

Additionally, this script can be integrated with cron scheduling for periodic automated backups.

---

## Script Breakdown

```bash
#!/bin/bash
```

This line specifies the interpreter for the script, which is Bash.

### **1. Validate Input Parameter**

```bash
if [ $# -ne 1 ]; then
    echo "Usage: $0 <target-directory>"
    exit 1
fi
```

- Ensures that exactly one argument (the target directory) is provided.
- Exits with an error message if no argument is given.

### **2. Define Required Variables**

```bash
target_dir="${1%/}"   # Remove trailing slash from the directory path
backup_prefix="backup"
timestamp=$(date +%Y-%m-%d_%H-%M-%S)
backup_dir="${target_dir}/${backup_prefix}_${timestamp}"
```

- `target_dir`: Stores the input directory path without a trailing slash.
- `backup_prefix`: Prefix for backup directories.
- `timestamp`: Generates a timestamp for naming backup directories.
- `backup_dir`: Full path for the backup directory.

### **3. Validate Target Directory**

```bash
if [ ! -d "$target_dir" ]; then
    echo "Error: Target directory $target_dir does not exist"
    exit 1
fi
```

- Checks if the target directory exists.
- Exits with an error message if the directory is invalid.

### **4. Create Backup Directory**

```bash
if ! mkdir -p "$backup_dir"; then
    echo "Error: Failed to create backup directory"
    exit 1
fi
```

- Creates the backup directory.
- Exits with an error message if directory creation fails.

### **5. Copy Files Excluding Existing Backups**

```bash
if rsync -a --exclude="${backup_prefix}_*" "$target_dir/" "$backup_dir"; then
    echo "Backup created: $backup_dir"
else
    echo "Error: Backup creation failed"
    exit 1
fi
```

- Uses `rsync` to copy files from the target directory to the backup directory.
- Excludes any existing backup directories.
- Provides success or error messages.

### **6. Rotate Backups (Keep Last 3)**

```bash
backups=($(ls -d "${target_dir}/${backup_prefix}_"* 2> /dev/null | sort))
backup_count=${#backups[@]}

if [ "$backup_count" -gt 3 ]; then
    remove_count=$((backup_count - 3))
    echo -e "\nRotating backups - removing $remove_count old version(s)"

    for (( i=0; i<remove_count; i++ )); do
        echo "Removing: ${backups[$i]}"
        rm -rf "${backups[$i]}"
    done
fi
```

- Lists existing backups and sorts them.
- Keeps only the last 3 backups by removing older ones.
- Prints messages indicating which backups are removed.

### **7. Display Current Backups**

```bash
echo -e "\nBackup complete.\n\nCurrent backups:"
ls -d "${target_dir}/${backup_prefix}_"* 2> /dev/null | sort -r | xargs -n 1 basename
```

- Displays the list of current backups in reverse order.

---

## Example Usage

### **First Execution**

```bash
./backup_with_rotation.sh /home/user/documents
```

**Output:**

```plaintext
Backup created: /home/user/documents/backup_2025-02-09_17-34-11

Backup complete.

Current backups:
backup_2025-02-09_17-34-11
```

### **Subsequent Executions with Rotation**

```bash
./backup_with_rotation.sh /home/user/documents
```

**Output:**

```plaintext
Backup created: /home/user/documents/backup_2025-02-09_17-50-00

Rotating backups - removing 1 old version(s)
Removing: /home/user/documents/backup_2025-02-09_17-34-11

Backup complete.

Current backups:
backup_2025-02-09_17-50-00
backup_2025-02-09_17-40-00
backup_2025-02-09_17-30-00
```

---

## Integration with Cron Scheduling

To automate the backup process, you can schedule the script using `cron`.

### **Steps to Schedule the Script**

1. Open the crontab file:

   ```bash
   crontab -e
   ```

2. Add a cron job to run the script daily at midnight:

   ```bash
   0 0 * * * /path/to/backup_with_rotation.sh /home/user/documents >> /var/log/backup.log 2>&1
   ```

3. Save and exit.

### **Explanation**

- `0 0 * * *`: Schedule the job to run at midnight every day.
- `/path/to/backup_with_rotation.sh`: Full path to the script.
- `/home/user/documents`: Directory to be backed up.
- `>> /var/log/backup.log 2>&1`: Redirects output and errors to a log file.

### **Benefits of Cron Scheduling**

- **Automation:** Eliminates the need for manual backups.
- **Consistency:** Ensures backups are taken at regular intervals.
- **Efficiency:** Keeps only the latest 3 backups using the script, reducing storage usage.
- **Monitoring:** Logs provide insights into backup operations.

---

## Conclusion

This script provides an efficient and automated way to manage directory backups with a rotation mechanism. Integrating it with cron scheduling ensures reliable and consistent backups, making it an essential tool for system administrators and developers.
