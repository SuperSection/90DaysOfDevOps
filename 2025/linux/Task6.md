# Task 6: Automate Backups with Shell Scripting

## Objective

1. To create a shell script to back up `/devops_workspace` as `backup_$(date +%F).tar.gz`.
2. Save it in `/backups` and schedule it using `cron`.
3. Make the script display a success message in **green text** using `echo -e`.

---

Here's a detailed solution for automating backups with a shell script, including cron scheduling and colored output:

```bash
#!/bin/bash

# Task 6: Backup Automation Script

# Create backups directory if it doesn't exist
mkdir -p "$2"


# Set source and target locations
DATE=$(date "+%F-%H-%M")
BACKUP_FILE="backup_${DATE}.tar.gz"


# Create compressed backup
echo -e "\e[32mStarting backup creation...\e[0m"
tar -czf "${2}/${BACKUP_FILE}" "$1" 2>/dev/null


# Check if backup succeeded and show result
if [ $? -eq 0 ]; then
   echo -e "\e[32mBackup created successfully!\e[0m"
   echo -e "\e[32mBackup location: ${2}/${BACKUP_FILE}\e[0m"
else
   echo -e "\e[31mBackup failed! Please check directories and permissions.\e[0m"
   exit 1
fi
```

---

## Step-by-Step Implementation Guide

1. **Create the Script**

```bash
cd ~  # Be at your home directory
mkdir -p scripts
vim scripts/backup_devops.sh
```

Paste the script above and save

- `i` to insert mode
- paste with `Ctrl+v`
- then `Esc` (to escape from Insert mode)
- Save and quit with `:wq`

2. **Make Executable**

```bash
chmod 700 backup_devops.sh
```

3. **Test the Script**

```bash
# Assuming you have a folder `devops_workspace` in your home directory
./backup_devops.sh /home/soumo/devops_workspace /home/soumo/backups
```

Successful output (green text):

```bash
Starting backup creation...
Backup created successfully!
Backup location: /backups/backup_2025-02-08.tar.gz
```

4. **Schedule with Cron**

```bash
crontab -e
# Select 2, vim editor
```

Add this line to run daily at midnight:

```bash
0 0 * * * /home/soumo/scripts/backup_devops.sh /home/soumo/devops_workspace /home/soumo/backups
```

5. **For Testing** (Optional)

Add this line to test for each minute:

```bash
* * * * * /home/soumo/scripts/backup_devops.sh /home/soumo/devops_workspace /home/soumo/backups
```

---

## Key Components Explained

1. **Color Output**
   - `\e[32m` - Green text
   - `\e[0m` - Reset to default color
   - `\e[31m` - Red text for errors

2. **Backup Process**
   - `tar -czf`: Creates compressed gzip archive
   - `2>/dev/null`: Hides standard error output
   - `$? -eq 0`: Checks if previous command succeeded

3. **Cron Scheduling**
   - `0 0 * * *`: Runs at 00:00 (midnight) daily
   - Other schedule examples:
     - `0 * * * *`: Hourly
     - `0 3 * * 1`: Every Monday at 3AM

---

## Verification Steps

1. **Check Backup File**

```bash
ls -lh /backups
```

Output:

```bash
-rw-r--r-- 1 root   root   198 Feb  8 12:11 backup_2025-02-08-12-11.tar.gz
```

2. **Check Cron Logs**

```bash
grep backup_devops /var/log/syslog
```

Sample Output:

```bash
2025-02-08T12:09:01.901999+00:00 ip-172-31-24-157 CRON[1457]: (soumo) CMD (/home/soumo/scripts/backup_devops.sh /home/soumo/devops_workspace /home/soumo/backups)
```

---

## Security Considerations

1. **Retention Policy**

Add this to the script to keep backups for 30 days:

```bash
# Delete backups older than 30 days
find "$dest" -name "backup_*.tar.gz" -mtime +30 -delete
```

2. **Permissions**

Ensure proper access control:

```bash
chmod 700 /home/soumo/backups
chown soumo:soumo /home/soumo/backups
```

---

## AWS EC2 Version (Bonus)

For cloud environments:

1. Create an EBS volume for backups
2. Mount it to `/backups`
3. To Store backups in S3 bucket

Use same script but add AWS-specific commands:

```bash
# Sync to S3 (optional)
aws s3 sync /backups s3://your-bucket/backups/
```

> **NOTE:**  You must have your AWS CLI setup with IAM access key
