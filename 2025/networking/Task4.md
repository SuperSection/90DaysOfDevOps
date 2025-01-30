# Hands-On with Networking Commands

This cheat sheet provides an overview of essential networking commands and their usage. These commands are vital for troubleshooting, monitoring, and managing network connectivity in DevOps environments.

---

## 1. ping

**Purpose:** Check the connectivity between your system and a remote host.
**Usage:**

```bash
ping <hostname or IP address>
```

**Example:**

```bash
ping google.com
```

**Description:** Sends ICMP echo requests to the target and displays the response time. Useful for determining whether a host is reachable.

---

## 2. traceroute / tracert

**Purpose:** Trace the path packets take to reach a destination.
**Usage:**

```bash
# For Linux
traceroute <hostname or IP address>

# For Windows
tracert <hostname or IP address>
```

**Example:**

```bash
traceroute google.com
```

**Description:** Displays the sequence of routers through which packets travel to reach the destination, helping diagnose routing issues.

---

## 3. netstat

**Purpose:** Display network connections, routing tables, and statistics.
**Usage:**

```bash
netstat -option
```

**Example:**

```bash
netstat -an
```

**Description:** Provides information about active connections and listening ports. Useful for identifying network activity and troubleshooting port usage.

**Common Options:**

- `-a`: Show all active connections.
- `-n`: Show numerical addresses instead of resolving hostnames.
- `-t`: Display TCP connections.

---

## 4. curl

**Purpose:** Transfer data from or to a server using various protocols.
**Usage:**

```bash
curl <URL>
```

**Example:**

```bash
curl https://api.github.com
```

**Description:** Sends HTTP requests and displays the response. Ideal for testing APIs and downloading web content.

**Common Options:**

- `-X <method>`: Specify the HTTP request method (GET, POST, etc.).
- `-H <header>`: Add a custom header to the request.
- `-d <data>`: Send data with the request.

---

## 5. dig / nslookup

**Purpose:**

- `dig`: Performs DNS lookups and displays the answers that are returned from the name server(s) that were queried
- `nslookup`: It is a program to query Internet domain name servers

**Usage:**

```bash
# For Linux
dig <domain>

# For Windows / Linux
nslookup <domain>
```

**Example:**

```bash
dig google.com

# OR
nslookup google.com
```

**Description:** Retrieves DNS records, including IP addresses and mail server information. Useful for troubleshooting DNS issues.

---

### Author: Soumo Sarkar

**Objective:** Build a simple and informative guide that explains each command's purpose, usage, and common options.

By mastering these commands, one can enhance their ability to troubleshoot and manage network-related tasks efficiently in DevOps environments.
