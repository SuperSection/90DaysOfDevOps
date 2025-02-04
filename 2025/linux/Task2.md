# Task 2: File and Directory Permissions

## Objective

1. Create a directory `/devops_workspace` and a file `project_notes.txt` inside it.
2. Set permissions so that:
   - The **owner** can read and write (edit).
   - The **group** can only read.
   - **Others** have no access.
3. Verify the permissions using `ls -l`.

---

## 1. Create the Directory and File

### 1.1 Create the Directory

Create the `devops_workspace` directory:

```bash
cd ~ # Optional but suggested for testing according to the given instructions
mkdir devops_workspace
```

### 1.2 Create the File

Create the `project_notes.txt` file inside the directory:

```bash
touch devops_workspace/project_notes.txt

# OR
echo "Working on Task 2 of Week 2 (Linux)" > devops_workspace/project_notes.txt
```

### 1.3 Change the Group of the File (optinal but suggested for testing)

Change the group of the file to `devops_team` instead of just `devops_user`:

```bash
chown :devops_team devops_workspace/project_notes.txt

# OR
chgrp devops_team devops_workspace/project_notes.txt
```

---

## 2. Set Permissions

### 2.1 Understand Permission Notation

Linux file permissions are represented as a 3-digit octal number or a symbolic notation:

- **Owner (u)**: The user who owns the file.
- **Group (g)**: The group that owns the file.
- **Others (o)**: Everyone else.

Each permission type is represented by a number:

- **4**: Read (r)
- **2**: Write (w)
- **1**: Execute (x)

### 2.2 Set Permissions Using Octal Notation

To set the permissions as per the task:

- **Owner**: Read and Write (`6` = 4 + 2)
- **Group**: Read (`4`)
- **Others**: No access (`0`)

Run the following command:

```bash
chmod 640 devops_workspace/project_notes.txt
```

### 2.3 Verify Permissions

Use the `ls -l` command to verify the permissions:

```bash
ls -l devops_workspace/project_notes.txt
```

Output:

```bash
-rw-r----- 1 devops_user devops_team 0 Feb  4 12:22 devops_workspace/project_notes.txt
```

- `-rw-r-----`: The permissions are set as:
  - `rw-` (Owner: Read and Write)
  - `r--` (Group: Read)
  - `---` (Others: No access)
- `devops_user devops_user`: The file is owned by the `devops_user` user and `devops_user` group.

---

## Step 3: Set Directory Permissions (Optional)

If you want to set permissions for the `devops_workspace` directory itself, use the following command:

```bash
# Change the group of the folder
chgrp devops_team devops_workspace

chmod 750 devops_workspace
```

- **Owner**: Read, Write, and Execute (`7` = 4 + 2 + 1)
- **Group**: Read and Execute (`5` = 4 + 1)
- **Others**: No access (`0`)

Verify the directory permissions:

```bash
ls -ld devops_workspace
```

Output:

```bash
drwxr-x--- 2 devops_user devops_team 4096 Feb  4 12:22 devops_workspace/
```

- `drwxr-x---`: The permissions are set as:
  - `rwx` (Owner: Read, Write, and Execute)
  - `r-x` (Group: Read and Execute)
  - `---` (Others: No access)

#### IMPORTANT ❗

Ensure that `devops_user` is accessible by `devops_team`:

```bash
sudo chgrp devops_team /home/devops_user
sudo chmod g+rx /home/devops_user
```

---

## 4. Test Permissions

### 4.1 Test Owner Permissions

Switch to the owner (e.g., `root`) and try to edit the file:

```bash
su - devops_user
echo "This is a test note." >> devops_workspace/project_notes.txt
cat devops_workspace/project_notes.txt
```

Output:

```bash
This is a test note.
```

### 4.2 Test Group Permissions

Add a user to the `devops_team` group (or the group owning the file) and test read access:

```bash
sudo usermod -aG devops_team $USER # adds the user to devops_team group

su - $USER # again login as the user
newgrp devops_team  # log in to devops_team group

cat /home/devops_user/devops_workspace/project_notes.txt
```

Output:

```bash
This is a test note.
```


### 4.3 Test Others' Permissions

Switch to a user who is not the owner or in the group and try to access the file:

```bash
sudo su - another_user
cat /home/devops_user/devops_workspace/project_notes.txt
```

Output:

```bash
cat: /home/devops_user/devops_workspace/project_notes.txt: Permission denied
```

---

## Summary of Main Commands for this

| Task | Command |
|------|---------|
| Create Directory | `mkdir devops_workspace` |
| Create File | `touch devops_workspace/project_notes.txt` |
| Set File Permissions | `chmod 640 devops_workspace/project_notes.txt` |
| Verify File Permissions | `ls -l devops_workspace/project_notes.txt` |
| Set Directory Permissions | `chmod 750 devops_workspace` |
| Verify Directory Permissions | `ls -ld devops_workspace` |

---

## Final Outputs

1. **File Permissions**:

```bash
-rw-r----- 1 devops_user devops_team 0 Feb  4 12:22 devops_workspace/project_notes.txt
```

2. **Directory Permissions**:

```bash
drwxr-x--- 2 devops_user devops_team 4096 Feb  4 12:22 devops_workspace/
```

3. **Permission Tests**:
   - Owner can read and write.
   - Group can read.
   - Others cannot access.
