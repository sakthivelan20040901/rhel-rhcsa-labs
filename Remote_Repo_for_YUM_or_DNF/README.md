# RHCSA Lab – Add New Remote Repository for YUM/DNF

## Objective

Configure a new software repository named **my_custom_repo** using the URL:

```
http://local.repo/rhel10
```

The goal of this task is to understand how Linux package managers (YUM/DNF) use repository configuration files to locate and install software packages.

---

## Concepts Covered

* Linux package repositories
* YUM/DNF repository configuration
* Repository configuration files
* Verifying repository configuration
* Understanding repository metadata errors

---

## Repository Configuration Location

Repository configuration files are stored in:

```
/etc/yum.repos.d/
```

Each repository is defined in a `.repo` file inside this directory.

---

## Step 1 – Navigate to Repository Directory

List existing repository files:

```bash
ls /etc/yum.repos.d/
```

---

## Step 2 – Create a New Repository File

Create the repository configuration file:

```bash
sudo vi /etc/yum.repos.d/my_custom_repo.repo
```

---

## Step 3 – Add Repository Configuration

Add the following content to the file:

```
[my_custom_repo]
name=my_custom_repo
baseurl=http://local.repo/rhel10
enabled=1
gpgcheck=0
```

### Explanation

| Parameter          | Description                                       |
| ------------------ | ------------------------------------------------- |
| `[my_custom_repo]` | Repository ID                                     |
| `name`             | Display name of the repository                    |
| `baseurl`          | URL where packages are located                    |
| `enabled=1`        | Enables the repository                            |
| `gpgcheck=0`       | Disables GPG verification (commonly used in labs) |

---

## Step 4 – Refresh Repository Metadata

```bash
sudo dnf clean all
sudo dnf makecache
```

---

## Step 5 – Verify the Repository

Check if the repository is visible to the system:

```bash
dnf repolist
```

Or check specific repository:

```bash
dnf repoinfo my_custom_repo
```

---

## Error Encountered During Verification

When running the verification command, the following error appeared:

```
Curl error (6): Could not resolve hostname
http://local.repo/rhel7/repodata/repomd.xml
Could not resolve host: local.repo
Error: Failed to download metadata for repo 'my_custom-repo'
```

---

## Reason for the Error

The URL `http://local.repo/rhel7` is an example repository used for training purposes.

Since the hostname **local.repo** does not exist on the system or DNS server, the system cannot download repository metadata.

However, the task requirement is **only to configure the repository**, not to access a real repository server.

Therefore, the configuration is considered correct even if the metadata cannot be downloaded.

---

## Commands Summary

```bash
ls /etc/yum.repos.d/

sudo vi /etc/yum.repos.d/my_custom_repo.repo

sudo dnf clean all
sudo dnf makecache

dnf repolist

dnf repoinfo my_custom_repo
```

---

## Learning Outcome

After completing this lab you will understand:

* How Linux repositories are configured
* Where repository configuration files are stored
* How package managers locate software packages
* How to troubleshoot repository metadata errors

---

## Real World Use Case

In enterprise environments, organizations often maintain **internal repositories** that host approved packages.

Example:

```
http://repo.company.local/rhel
```

All servers within the infrastructure install software from this centralized repository, improving security, consistency, and package management.

---

## Suggested Screenshots

Include screenshots of:

* Repository file creation
* Repository configuration file contents
* `dnf repolist` output
* Error message from `dnf repoinfo`
