# RHCSA Lab – Create Users with Specific UID and Password Expiration

## Objective

Create two users with specific UID/GID values and configure password and account expiration settings.

This task practices Linux user management, which is an essential skill for RHCSA system administration.

---

## Task Requirements

Create the following users:

| User  | UID/GID | Password |
| ----- | ------- | -------- |
| john  | 2000    | 12345678 |
| davis | 3000    | 87654321 |

Additional requirement:

* The **davis** account must expire in **30 days**.

---

## Steps

1. Become the root user
2. Create user **john** with UID/GID 2000
3. Set the password for **john**
4. Create user **davis** with UID/GID 3000
5. Set the password for **davis**
6. Configure the **davis** account to expire in 30 days
7. Verify user IDs and expiration settings

---

## Commands Used

```bash
sudo -i

useradd -u 2000 -U john
passwd john

useradd -u 3000 -U davis
passwd davis

chage -E $(date -d +30days +%Y-%m-%d) davis

chage -l davis

id john
id davis

cat /etc/passwd | grep -E "john|davis"
```

---

## Verification

Verify that users were created with correct UID/GID:

```bash
id john
id davis
```

Example Output:

```
uid=2000(john) gid=2000(john)
uid=3000(davis) gid=3000(davis)
```

Check account expiration:

```bash
chage -l davis
```

Example Output:

```
Account expires : Apr 09, 2026
```

---

## Screenshots

Include screenshots of the following commands:

* useradd john
* passwd john
* useradd davis
* passwd davis
* chage -l davis
* id john and id davis

---

## Key Learning

* Managing Linux users with specific UID/GID
* Setting user passwords
* Configuring account expiration with `chage`
* Verifying user configuration using system commands

These skills are fundamental for Linux system administrators and RHCSA certification preparation.
