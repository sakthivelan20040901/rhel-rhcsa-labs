# RHCSA Lab – Shared Directory Using Group Ownership (SGID)

## Objective

Create a shared directory `/common` where the users **john** and **davis** can collaborate. Both users must be able to read, write, and delete each other's files, while users who are not members of the group must have no access.

This lab demonstrates Linux **group ownership** and the **SGID (Set Group ID)** permission used for shared directories.

---

## Task Requirements

1. Create a directory `/common`.
2. Create a group named `team`.
3. Add users **john** and **davis** to the group `team`.
4. Set the group ownership of `/common` to `team`.
5. Configure permissions so:

   * `john` and `davis` can read, write, and delete files.
   * Any user outside the group cannot access the directory.
6. Ensure all files created inside `/common` automatically inherit the group `team`.

---

## Steps

1. Create the directory `/common`
2. Create the group `team`
3. Change the group ownership of the directory
4. Enable SGID on the directory
5. Add users `john` and `davis` to the `team` group
6. Verify permissions and group membership

---

## Commands Used

```bash
mkdir /common

groupadd team

chgrp team /common

chmod 2770 /common

usermod -aG team john
usermod -aG team davis

ls -ld /common

groups john
groups davis
```

---

## Understanding SGID

The permission `2770` enables the **SGID bit** on the directory.

Permission breakdown:

```
2 → SGID bit
7 → Owner permissions (rwx)
7 → Group permissions (rwx)
0 → No access for others
```

When **SGID** is set on a directory:

* All new files created inside the directory automatically inherit the **group owner** of the directory.
* This allows group members to collaborate without manually adjusting file permissions.

Example permission output:

```
drwxrws--- root team /common
```

Notice the **s** in the group permission section. This indicates SGID is active.

---

## Verification

Check directory permissions:

```bash
ls -ld /common
```

Example output:

```
drwxrws--- root team /common
```

Check group membership:

```bash
groups john
groups davis
```

Both users should include the `team` group.

---

## Test the Shared Directory

Login as `john` and create a file:

```bash
su - john
touch /common/testfile
```

Switch to `davis` and modify or remove the file:

```bash
su - davis
rm /common/testfile
```

If both users can create, edit, and remove files in `/common`, the configuration is correct.

---

## Screenshots

Include screenshots of:

* Creating the group `team`
* Setting directory permissions with `chmod 2770`
* Checking `/common` directory permissions
* Verifying group membership of `john` and `davis`

---

## Key Learning

* Managing Linux groups
* Configuring shared directories
* Understanding **SGID permissions**
* Implementing collaborative access control for multiple users

This configuration is commonly used in Linux servers where teams need shared access to project directories.
