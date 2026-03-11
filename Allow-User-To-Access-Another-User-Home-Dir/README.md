# RHCSA Lab – Allow a User to Access Another User's Home Directory

## Objective

Allow the user **davis** to have full access to the home directory of **john** while keeping **john** as the owner of the directory.

This task demonstrates the use of **ACL (Access Control Lists)** in Linux to provide permissions to specific users without changing the file ownership.

---

## Task Requirement

Allow **davis** (and only davis) to have **full access (read, write, execute)** to:

```
/home/john
```

The owner of the directory must remain **john**.

---

## Steps

1. Verify the current permissions of john's home directory
2. Use ACL to grant davis read, write, and execute permissions
3. Apply default ACL so new files created in the directory also allow davis access
4. Verify the ACL configuration

---

## Commands Used

```bash
ls -ld /home/john

setfacl -R -m u:davis:rwx /home/john

setfacl -R -m d:u:davis:rwx /home/john

getfacl /home/john
```

---

## Alternative Single Command

The permissions for existing and future files can also be applied using a single command:

```bash
setfacl -R -m u:davis:rwx,d:u:davis:rwx /home/john
```

---

## Verification

Check ACL configuration:

```bash
getfacl /home/john
```

Example output:

```
# file: home/john
# owner: john
# group: john

user::rwx
user:davis:rwx
group::---
mask::rwx
other::---
default:user:davis:rwx
```

Also check the directory permissions:

```bash
ls -ld /home/john
```

You may see a **+** symbol at the end of the permissions, which indicates ACLs are enabled.

Example:

```
drwx------+
```

---

## Screenshots

Include screenshots of the following commands:

* Directory permissions check
* ACL configuration using `setfacl`
* ACL verification using `getfacl`

---

## Key Learning

* Understanding Linux **Access Control Lists (ACL)**
* Granting permissions to specific users without changing file ownership
* Applying default ACLs for newly created files

ACLs are commonly used in multi‑user Linux environments where fine‑grained access control is required.
