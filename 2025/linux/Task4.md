# Task 4: Volume Management & Disk Usage

## Objective

1. Create a directory `/mnt/devops_data`.
2. Mount a **loop device** (simulating a volume for local practice).
3. Verify the mount using `df -h` and `mount | grep devops_data`.

---

## 1. Create the Directory

```bash
sudo mkdir -p /mnt/devops_data
```

- `-p`: Ensures parent directories are created if missing (though not needed here).

---

## 2. Create a Loop Device (Simulate a Volume)

### 2.1 Create a File to Act as a "Disk"

Create a 1GB file to simulate a disk:

```bash
sudo dd if=/dev/zero of=/storagefile bs=1M count=1024
```

- `if=/dev/zero`: Input source (zeroes for empty file).
- `of=/storagefile`: Output file name.
- `bs=1M`: Block size of 1MB.
- `count=1024`: Total size = 1MB * 1024 = 1GB.

Output:

```bash
1024+0 records in
1024+0 records out
1073741824 bytes (1.1 GB, 1.0 GiB) copied, 4.45441 s, 241 MB/s
```

### 2.2 Format the File as ext4

Format `/storagefile` with the ext4 filesystem:

```bash
sudo mkfs.ext4 /storagefile
```

Output (truncated for brevity):

```bash
mke2fs 1.46.5 (30-Dec-2021)
Discarding device blocks: done
Creating filesystem with 262144 4k blocks and 65536 inodes
Filesystem UUID: 243397ee-e9bf-46a5-bf0c-2802b2b6c260
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376

Allocating group tables: done
Writing inode tables: done
Creating journal (8192 blocks): done
Writing superblocks and filesystem accounting information: done
```

### 2.3 Mount the Loop Device

Mount the file to `/mnt/devops_data` using the `loop` option:

```bash
sudo mount -o loop /storagefile /mnt/devops_data
```

---

## 3. Verify the Mount

### 3.1 Using `df -h`

Check disk space usage and confirm the mount:

```bash
df -h | grep devops_data
```

Output:

```bash
/dev/loop0      974M   24K  907M   1% /mnt/devops_data
```

### 3.2 Using `mount | grep devops_data`

Check active mounts:

```bash
mount | grep devops_data
```

Output:

```bash
/storagefile on /mnt/devops_data type ext4 (rw,relatime)
```

---

## Optional: Make the Mount Permanent

To retain the mount after reboot, add it to `/etc/fstab`:

```bash
echo '/storagefile /mnt/devops_data ext4 loop 0 0' | sudo tee -a /etc/fstab
```

---

## Summary of Commands

| Task | Command |
|------|---------|
| Create directory | `sudo mkdir -p /mnt/devops_data` |
| Create storage file | `sudo dd if=/dev/zero of=/storagefile bs=1M count=1024` |
| Format as ext4 | `sudo mkfs.ext4 /storagefile` |
| Mount loop device | `sudo mount -o loop /storagefile /mnt/devops_data` |
| Verify with `df` | `df -h \| grep devops_data` |
| Verify with `mount` | `mount \| grep devops_data` |

---

## Final Outputs

- A 1GB loop device mounted at `/mnt/devops_data`.
- Verification via `df -h` and `mount` confirms the mount is active.
