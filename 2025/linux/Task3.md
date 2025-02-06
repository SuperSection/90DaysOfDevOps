# Task 3: Log File Analysis with AWK, Grep, and Sed

## Objective

1. Download the `Linux_2k.log` file from the LogHub GitHub repository.
2. Extract insights using the following commands:
   - Use `grep` to find all occurrences of the word "error".
   - Use `awk` to extract timestamps and log levels.
   - Use `sed` to replace all IP addresses with `[REDACTED]` for security.
3. Bonus: Find the most frequent log entry using `awk` or `sort | uniq -c | sort -nr | head -10`.


## Step 1: Download the Log File

### 1.1 Clone the LogHub Repository

Clone the LogHub repository to your local machine:

```bash
git clone https://github.com/logpai/loghub.git
```

### 1.2 Navigate to the Log Directory

Move to the directory containing the `Linux_2k.log` file:

```bash
cd loghub/Linux/
```

### 1.3 Verify the Log File

Check if the `Linux_2k.log` file exists:

```bash
ls -l Linux_2k.log
```

Output:

```bash
-rw-r--r-- 1 soumo soumo 216485 Feb  6 09:26 Linux_2k.log
```

---

## Step 2: Analyze the Log File

### 2.1 Use `grep` to Find All Occurrences of "error"

Search for all lines containing the word "error" (case-insensitive):

```bash
grep -i "error" Linux_2k.log
```

- `-i`: Makes the search case-insensitive.

#### No Output

No keyword matches "error"


### 2.2 Use `awk` to Extract Timestamps and Log Levels

Extract the timestamp (first field) and log level (second field) from each log entry:

```bash
awk '{
   timestamp = $1 " " $2 " " $3;
   if ($0 ~ /authentication failure/) {
      log_level = "ERROR";
   } else if ($0 ~ /session opened/) {
      log_level = "INFO";
   } else if ($0 ~ /session closed/) {
      log_level = "INFO";
   } else if ($0 ~ /ALERT/) {
      log_level = "ALERT";
   } else {
      log_level = "INFO";
   }
   print timestamp, log_level;
}' Linux_2k.log
```

- `$1`: Represents the first field (month).
- `$2`: Represents the second field (date).
- `$3`: Represents the third field (timestamp).
- `$0`: Represents the entire line.

#### Output

```bash
Jun 14 15:16:01 ERROR
Jun 14 15:16:02 INFO
Jun 14 15:16:02 ERROR
Jun 15 02:04:59 ERROR
Jun 15 02:04:59 ERROR
Jun 15 02:04:59 ERROR
Jun 15 02:04:59 ERROR
Jun 15 02:04:59 ERROR
Jun 15 02:04:59 ERROR
Jun 15 02:04:59 ERROR
Jun 15 02:04:59 ERROR
Jun 15 02:04:59 ERROR
Jun 15 02:04:59 ERROR
Jun 15 04:06:18 INFO
Jun 15 04:06:19 INFO
Jun 15 04:06:20 ALERT
Jun 15 04:12:42 INFO
Jun 15 04:12:43 INFO
...
...
```


### 2.3 Use `sed` to Replace IP Addresses with `[REDACTED]`

Replace all IP addresses in the log file with `[REDACTED]`:

```bash
sed -E 's/([0-9]{1,3}\.){3}[0-9]{1,3}/[REDACTED]/g' Linux_2k.log
```

- `-E`: Enables extended regular expressions.
- `([0-9]{1,3}\.){3}[0-9]{1,3}`: Matches an IP address (e.g., `192.168.1.1`).
- `[REDACTED]`: Replaces the matched IP address.

#### Ouput

```bash
...
Jun 17 07:07:00 combo ftpd[29504]: connection from [REDACTED] (24-54-76-216.bflony.adelphia.net) at Fri Jun 17 07:07:00 2005
Jun 17 07:07:00 combo ftpd[29508]: connection from [REDACTED] (24-54-76-216.bflony.adelphia.net) at Fri Jun 17 07:07:00 2005
Jun 17 07:07:00 combo ftpd[29507]: connection from [REDACTED] (24-54-76-216.bflony.adelphia.net) at Fri Jun 17 07:07:00 2005
Jun 17 07:07:00 combo ftpd[29505]: connection from [REDACTED] (24-54-76-216.bflony.adelphia.net) at Fri Jun 17 07:07:00 2005
Jun 17 07:07:00 combo ftpd[29506]: connection from [REDACTED] (24-54-76-216.bflony.adelphia.net) at Fri Jun 17 07:07:00 2005
Jun 17 07:07:00 combo ftpd[29509]: connection from [REDACTED] (24-54-76-216.bflony.adelphia.net) at Fri Jun 17 07:07:00 2005
Jun 17 07:07:02 combo ftpd[29510]: connection from [REDACTED] (24-54-76-216.bflony.adelphia.net) at Fri Jun 17 07:07:02 2005
Jun 17 07:07:04 combo ftpd[29511]: connection from [REDACTED] (24-54-76-216.bflony.adelphia.net) at Fri Jun 17 07:07:04 2005
Jun 17 19:43:13 combo sshd(pam_unix)[30565]: authentication failure; logname= uid=0 euid=0 tty=NODEVssh ruser= rhost=[REDACTED]  user=guest
...
...
```

---

## Step 3: Bonus - Find the Most Frequent Log Entry

### 3.1 Use `awk` to Extract Log Messages

Extract the log messages (all fields except the first two):

```bash
awk '{for (i=5; i<=NF; i++) printf $i " "; print ""}' Linux_2k.log
```

- `NF`: Represents the number of fields in the current line.
- `for (i=5; i<=NF; i++)`: Loops through fields starting from the 5th field.

### 3.2 Find the Most Frequent Log Entry

Use `sort`, `uniq`, and `head` to find the top 10 most frequent log entries:

```bash
awk '{for (i=5; i<=NF; i++) printf $i " "; print ""}' Linux_2k.log | sort | uniq -c | sort -nr | head -10
```

- `sort`: Sorts the log entries alphabetically.
- `uniq -c`: Counts the occurrences of each unique log entry.
- `sort -nr`: Sorts the counts in descending order.
- `head -10`: Displays the top 10 most frequent log entries.

#### Output

```bash
   43 logrotate: ALERT exited abnormally with [1]
   16 named[2306]: notify question section contains no SOA
   7 syslogd 1.4.1: restart.
   6 cups: cupsd startup succeeded
   6 cups: cupsd shutdown succeeded
   1 xinetd[26484]: warning: can't get client address: Connection reset by peer
   1 xinetd[26482]: warning: can't get client address: Connection reset by peer
   1 udev[12798]: creating device node '/udev/vcsa2'
   1 udev[12795]: creating device node '/udev/vcs2'
   1 udev[12790]: removing device node '/udev/vcsa2'
```

---

## Summary of Commands

| Task | Command |
|------|---------|
| Find "error" occurrences | `grep -i "error" Linux_2k.log` |
| Extract timestamps and log levels | `awk '{ timestamp = $1 " " $2 " " $3; if ($0 ~ /authentication failure/) {log_level = "ERROR"} else if ($0 ~ /session opened/) {log_level = "INFO"} else if ($0 ~ /session closed/) {log_level = "INFO"} else if ($0 ~ /ALERT/) {log_level = "ALERT"} else {log_level = "INFO"} print timestamp, log_level}' Linux_2k.log` |
| Replace IP addresses | `sed -E 's/([0-9]{1,3}\.){3}[0-9]{1,3}/[REDACTED]/g' Linux_2k.log` |
| Find most frequent log entry | `awk '{for (i=5; i<=NF; i++) printf $i " "; print ""}' Linux_2k.log \| sort \| uniq -c \| sort -nr \| head -10` |
