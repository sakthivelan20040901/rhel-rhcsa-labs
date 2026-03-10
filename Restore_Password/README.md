# RHCSA Lab 01 – Restore Root Password

## Objective
Reset the root password when it is unknown.

This is a common Linux recovery task used by system administrators.

---

## Steps

1. Reboot the system
2. Enter GRUB boot menu
3. Edit kernel parameters and add `rd.break`
4. Boot into rescue shell
5. Remount the root filesystem as read/write
6. Enter the system environment using `chroot`
7. Reset the root password
8. Trigger SELinux relabel
9. Reboot the system
10. Login using the new root password

---

## Commands Used

```bash
mount -o remount,rw /sysroot
chroot /sysroot
passwd
touch /.autorelabel
# rhel-rhcsa-labs
