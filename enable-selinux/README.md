# RHCSA Lab 02 – Enable SELinux Enforcing Mode

## Objective
Enable SELinux in enforcing mode on the system.

SELinux (Security-Enhanced Linux) provides mandatory access control to improve the security of the Linux system.

---

## Steps

1. Check the current SELinux status
2. Open the SELinux configuration file
3. Change the SELinux mode to `enforcing`
4. Save the configuration file
5. Reboot the system
6. Verify SELinux is running in enforcing mode

---

## Commands Used

```bash
getenforce
sudo nano /etc/selinux/config
sudo reboot
getenforce
