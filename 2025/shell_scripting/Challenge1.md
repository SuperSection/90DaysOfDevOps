# Week 3 Challenge 1: User Account Management

## Introduction

This challenge involves creating a robust bash script to manage user accounts on a Linux system. The script allows administrators to perform essential user account tasks such as creation, deletion, password resets, and more, all from the command line.

---

## Features

### **Part 1: Account Creation**

The script provides the ability to create a new user account with the following steps:

1. **Prompt for New Username:** The user is prompted to enter the desired username.
2. **Username Availability Check:** The script verifies if the username already exists and exits with an error if it does.
3. **Password Setup:** The user is prompted to enter a secure password.
4. **Account Creation:** The new user account is created with a home directory.
5. **Success Confirmation:** A confirmation message is displayed after a successful creation.

Command: `./user_management.sh -c` or `./user_management.sh --create`

---

### **Part 2: Account Deletion**

The script can delete existing user accounts:

1. **Prompt for Username:** The user enters the username of the account to be deleted.
2. **Username Check:** The script ensures the username exists before deletion.
3. **Home Directory Deletion Option:** The user is given the option to delete the home directory along with the account.
4. **Success Confirmation:** A message confirms successful deletion.

Command: `./user_management.sh -d` or `./user_management.sh --delete`

---

### **Part 3: Password Reset**

The script supports resetting user passwords:

1. **Prompt for Username:** The user enters the username whose password needs to be reset.
2. **Username Check:** Ensures the username exists.
3. **New Password Setup:** The user is prompted for a new password.
4. **Success Confirmation:** A message confirms the password has been successfully reset.

Command: `./user_management.sh -r` or `./user_management.sh --reset`

---

### **Part 4: List User Accounts**

The script can list all user accounts with corresponding UIDs:

1. **Output Format:** The script displays a table-like structure with UIDs and usernames.

Command: `./user_management.sh -l` or `./user_management.sh --list`

---

## **Bonus Features**

The script includes additional advanced functionalities for enhanced user management:

### **1. Detailed User Information**

Display comprehensive details about a specific user account, including UID, GID, home directory, and default shell.

Command: `./user_management.sh -i` or `./user_management.sh --info`

### **2. Modify Username**

Change an existing user's username and optionally update the home directory path.

Command: `./user_management.sh -n` or `./user_management.sh --modify-username`

### **3. Modify UID**

Change the UID of an existing user.

Command: `./user_management.sh -u` or `./user_management.sh --modify-uid`

### **4. Modify User Shell**

Change the default shell for an existing user.

Command: `./user_management.sh -s` or `./user_management.sh --modify-shell`

---

### **Part 5: Help and Usage Information**

The script provides a help section to guide the user on available options and their usage.

Command: `./user_management.sh -h` or `./user_management.sh --help`

Example Output:

```plaintext
User Account Management Script
Usage: ./user_management.sh [OPTION]

Options:
  -c, --create              Create new user account
  -d, --delete              Delete existing user account
  -r, --reset               Reset user password
  -l, --list                List all user accounts
  -i, --info                Show detailed user information
  -n, --modify-username     Change username
  -u, --modify-uid          Change user UID
  -s, --modify-shell        Change user's default shell
  -h, --help                Show this help message
```

---

## Error Handling

The script includes robust error handling to ensure smooth operation:

- Checks for root privileges.
- Validates user inputs for username and password requirements.
- Ensures that shell changes are made only to valid shells listed in `/etc/shells`.
- Handles scenarios where operations are attempted on non-existent or duplicate user accounts.

---

### Conclusion

This bash script provides a comprehensive solution for user account management on Linux systems. By supporting essential functions and advanced bonus features, it ensures efficient and secure system administration.
