# Protocols and Ports for DevOps

This document provides a concise guide to the most commonly used protocols and their respective ports for DevOps professionals. Understanding these networking fundamentals is essential for secure and efficient infrastructure management.

---

## 1. HTTP and HTTPS

### HTTP (Hypertext Transfer Protocol)

- **Port:** 80
- **Usage:** Transfers data between a client and a web server.

### HTTPS (Hypertext Transfer Protocol Secure)

- **Port:** 443
- **Usage:** Secure communication by encrypting data between the client and server.

---

## 2. FTP and SFTP

### FTP (File Transfer Protocol)

- **Port:** 21
- **Usage:** Transfers files between a client and server (less secure).

### SFTP (Secure File Transfer Protocol)

- **Port:** 22 (uses SSH)
- **Usage:** Secure file transfers, ensuring encrypted communication.

---

## 3. SSH (Secure Shell)

- **Port:** 22
- **Usage:** Provides secure remote access to servers and facilitates encrypted communication.

---

## 4. DNS (Domain Name System)

- **Port:** 53
- **Usage:** Resolves domain names to IP addresses for both public and internal network operations.

---

## 5. Email Protocols

### SMTP (Simple Mail Transfer Protocol)

- **Port:** 25
- **Usage:** Sending emails from servers.

### POP3 (Post Office Protocol)

- **Port:** 110
- **Usage:** Downloading emails to a local device.

### IMAP (Internet Message Access Protocol)

- **Port:** 143
- **Usage:** Synchronizing email messages across multiple devices.

---

## 6. Database Ports

### MySQL

- **Port:** 3306
- **Usage:** Managing and storing relational database records.

### PostgreSQL

- **Port:** 5432
- **Usage:** Advanced relational database management.

---

## 7. DevOps Tools Ports

### Docker

- **Ports:** Varies (default management on 2375 or 2376 with TLS)
- **Usage:** Managing containerized applications.

### Kubernetes

- **Ports:** 6443 (API server), other dynamic ports for services
- **Usage:** Orchestrating and managing containerized environments.

### Prometheus

- **Port:** 9090 (default)
- **Usage:** Monitoring and alerting.

### GitHub

- **Ports:** 22 (SSH), 443 (HTTPS)
- **Usage:** Secure repository management and version control.

---

## 8. Security Best Practices for Ports and Protocols

- **Firewall Management:** Close unnecessary ports to reduce security risks.

- **Least Privilege Access:** Allow only required ports and IP ranges.

- **Encryption:** Always use secure protocols (e.g., HTTPS, SFTP).

- **Monitoring:** Continuously track port usage for anomalies.

---

## The Blog on Protocols and Ports

- **Author:** Soumo Sarkar

I have published a detailed blog that covers these protocols, ports, and best practices in depth. It includes practical DevOps tips, use cases, and security recommendations.

🔗 [Read the full article here.](https://devops-easy.hashnode.dev/mastering-networking-protocols-and-ports)
