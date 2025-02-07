# Task 5: Process Management & Monitoring

## Objective

1. Start a background process (`ping google.com > ping_test.log &`).
2. Use `ps`, `top`, and `htop` to monitor it.
3. Kill the process and verify it's gone.

---

## Step 1: Start a Background Process

```bash
ping google.com > ping_test.log &
```

### Explanation

- `ping google.com`: Continuously pings Google's server.
- `> ping_test.log`: Redirects the output to a file.
- `&`: Runs the process in the background.

You will see an output like:

```bash
[1] 460849
```

Where `460849` is the **Process ID (PID)**.

---

## Step 2: Monitor the Process

### Using `ps`

```bash
ps aux | grep ping
```

This lists the ping process along with its details. Look for something like:

```bash
soumo     460849  0.1  0.0  11212  1276 pts/0    SN   12:05   0:00 ping google.com
```

### Using `top`

```bash
top
```

- Press `Shift + M` to sort by memory usage or `Shift + P` to sort by CPU usage.
- **Manual Search:** Use the arrow keys to scroll and look for the process name.
- Press `q` to exit `top`.

The output the process will be displayed like:

```bash
460849 soumo     25   5   11212   1276   1144 S   0.0   0.0   0:02.35 ping
```

### Using `htop`

If not installed already, install it first:

```bash
sudo apt update -y
sudo apt install htop
```

Then use it:

```bash
htop
```

- Use the arrow keys to navigate.
- Look for the ping process, highlighted with details like PID and memory usage.
- Press `F3` to search for `ping`.

The view of the process will be like:

```bash
460849 soumo     25   5   11212   1276   1144 S   0.0   0.0   0:03.74 ping google.com
```

---

## Step 3: Kill the Process

```bash
kill 460849
```

Or use the `pkill` command:

```bash
pkill ping
```

Output after killing the process:

```bash
[1]  + 460849 terminated  ping google.com > ping_test.log
```

### Force Kill (if not terminating normally)

```bash
kill -9 12345
```

---

## Step 4: Verify the Process is Gone

```bash
ps aux | grep ping
```

If no output appears (other than the `grep` command itself), the process has been successfully terminated.

---

## Bonus Tip for AWS EC2 Instances

If you're doing this task on an **AWS EC2 instance**, ensure the security group allows ICMP (ping) requests, or the ping may not work as expected.
