# Task1: User & Group Management


## Objective

1. Create a user `devops_user` and add them to a group `devops_team`.
2. Set a password for `devops_user` and grant sudo access.
3. Restrict SSH login for certain users in `/etc/ssh/sshd_config`.

---

## 1. Create a User and Group

### 1.1 Create the `devops_user` User

To create a new user named `devops_user`, use the following command:

```bash
sudo adduser devops_user
```

You will be prompted to set a password and provide additional information (e.g., full name, room number). Fill in the details or press `Enter` to skip. This method by default creates a home directory for that new user.


#### Alternatively, you can use `useradd`

However, useradd requires additional options to create a home directory for the user. Also it doesn't provide option to set password.

```bash
sudo useradd -m devops_user
```

- `-m`: Creates the user's home directory.


### 1.2 Create the `devops_team` Group

To create a new group named `devops_team`, use the following command:

```bash
sudo groupadd devops_team
```


### 1.3 Add `devops_user` to `devops_team`

To add the user `devops_user` to the group `devops_team`, use the following command:

```bash
sudo usermod -aG devops_team devops_user

# OR
sudo gpasswd -a devops_user devops_team
```


### 1.4 Verify the User and Group

To verify that the user has been created and added to the group, use the following commands:

```bash
id devops_user
```

Output:

```bash
uid=1001(devops_user) gid=1001(devops_user) groups=1001(devops_user),1002(devops_team)
```

You can also check the user's group membership using:

```bash
groups devops_user
```

Output:

```bash
devops_user : devops_user devops_team
```

---

## 2. Set a Password and Grant Sudo Access

### 2.1 Set a Password for `devops_user`

If you didn't set a password during user creation, you can set it using:

```bash
sudo passwd devops_user
```

You will be prompted to enter and confirm the new password.

### 2.2 Grant Sudo Access to `devops_user`

To grant `devops_user` sudo access, add them to the `sudo` group:

```bash
sudo usermod -aG sudo devops_user
```

Verify sudo access by switching to `devops_user` and running a command with `sudo`:

```bash
su - devops_user
sudo ls /root
```

If prompted for a password, enter the password for `devops_user`. If the command executes successfully, sudo access is granted.


### 2.3 Grant Sudo Access to all members of a Group (Optional)

1. Open the /etc/sudoers file using the visudo command

   ```bash
   sudo visudo
   ```

2. Add the following line to grant sudo access to all members of the devops_team group:

```bash
%devops_team ALL=(ALL:ALL) ALL
```

---

## 3. Restrict SSH Login for Certain Users

### 3.1 Edit the SSH Configuration File

Open the SSH configuration file `/etc/ssh/sshd_config` in a text editor:

```bash
sudo nano /etc/ssh/sshd_config
```


### 3.2 Restrict SSH Access

To restrict SSH access to specific users (e.g., `devops_user`), add the following line to the file:

```bash
AllowUsers devops_user
```

This ensures that only `devops_user` can log in via SSH. If you want to allow multiple users, separate them with a space:

```bash
AllowUsers devops_user user2 user3
```

#### NOTE

OR, alternatively you can use DenyUsers to explicitly deny SSH access to certain users while allowing all others. For example:

```bash
DenyUsers user1 user2
```

This denies SSH access to user1 and user2 while allowing all other users.


### 3.3 Restart the SSH Service

After making changes, restart the SSH service to apply the new configuration:

```bash
sudo systemctl restart sshd
```

### 3.4 Verify SSH Access

Attempt to log in via SSH as a user not listed in `AllowUsers`. The login should be denied. Then, log in as `devops_user` to confirm access.


#### Find the Server's or local IP Address

To connect to the SSH server, you need its IP address. Use the following command to find it:

```bash
ip a
```

Look for the inet address under your network interface (e.g., eth0 or wlp2s0). For example:

```bash
inet 172.168.1.100/24
```

#### Authenticate using SSH

On another machine (or the same machine if you're testing locally), use the ssh command to connect:

```bash
ssh devops_user@172.168.1.100
```

- Replace 172.168.1.100 with the IP address of your SSH server (or local device).

You will be prompted to enter the password for ssh_user. Enter the password you set previously.
Example Output:

```bash
devops_user@172.168.1.100's password:
Welcome to Ubuntu 22.04 LTS (GNU/Linux 5.15.0-83-generic x86_64)
...

devops_user@hostname:~$
```

---

## Final Results

1. **User and Group Creation**:
   - User `devops_user` created.
   - Group `devops_team` created.
   - `devops_user` added to `devops_team`.

2. **Password and Sudo Access**:
   - Password set for `devops_user`.
   - `devops_user` granted sudo access.

3. **SSH Restriction**:
   - SSH access restricted to `devops_user` (or specified users).
   - SSH service restarted and verified.

---

## Files Modified

- `/etc/passwd`: Contains user information.
- `/etc/group`: Contains group information.
- `/etc/ssh/sshd_config`: SSH configuration file.
