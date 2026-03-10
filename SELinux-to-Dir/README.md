# RHCSA Lab – Assign SELinux Context to a Directory

## Objective

Assign the same SELinux context used by home directories to the `/xfs` directory permanently.

This ensures the directory follows the same SELinux access rules as user home directories.

---

## Steps

1. Create the `/xfs` directory
2. Check the SELinux context used by `/home`
3. Install the `semanage` tool if it is not available
4. Assign the same SELinux context to `/xfs`
5. Apply the new SELinux policy to the filesystem
6. Verify the context has been applied correctly

---

## Commands Used

```bash
sudo mkdir /xfs
ls -Zd /home
sudo yum install -y policycoreutils-python-utils
sudo semanage fcontext -a -t user_home_dir_t "/xfs(/.*)?"
sudo restorecon -Rv /xfs
ls -Zd /xfs
