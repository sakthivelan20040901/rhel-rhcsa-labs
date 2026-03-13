# RHCSA Lab – Install New Kernel and Set It as Default

## Objective

Install a new Linux kernel on the system and ensure that:

* The newly installed kernel becomes the **default kernel at boot**
* The **previous kernel remains available** for recovery

This lab demonstrates how Linux systems safely install new kernels without replacing the existing one, allowing administrators to roll back if needed.

---

## Concepts Covered

* Linux kernel management
* Package installation using `dnf`
* Verifying installed kernels
* Managing default boot kernel using `grubby`
* System reboot verification

---

## Step 1 – Check the Currently Running Kernel

Run the following command to check the current kernel version:

```bash
uname -r
```

Example output:

```
6.12.0-124.38.1.el10_1.x86_64
```

---

## Step 2 – List Installed Kernel Packages

```bash
rpm -q kernel
```

This command shows all kernel versions currently installed on the system.

---

## Step 3 – Install the Latest Kernel

Install a new kernel from the system repositories:

```bash
sudo dnf install kernel -y
```

Linux installs the new kernel **alongside the existing one**, instead of replacing it.

---

## Step 4 – Verify Installed Kernels

```bash
rpm -q kernel
```

Example output:

```
kernel-6.12.0-124
kernel-6.12.0-140
```

This confirms that the previous kernel is still available.

---

## Step 5 – Check Kernel Boot Entries

Use `grubby` to list all available kernel boot entries:

```bash
grubby --info=ALL
```

Example output:

```
index=0 kernel=/boot/vmlinuz-6.12.0-140
index=1 kernel=/boot/vmlinuz-6.12.0-124
```

The kernel with **index 0** is the default kernel loaded during boot.

---

## Step 6 – Set the Default Kernel (If Needed)

If the newly installed kernel is not the default, set it manually:

```bash
sudo grubby --set-default-index=0
```

---

## Step 7 – Reboot the System

```bash
sudo reboot
```

---

## Step 8 – Verify the Running Kernel

After reboot, confirm that the system is running the new kernel:

```bash
uname -r
```

---

## Commands Summary

```bash
uname -r
rpm -q kernel
sudo dnf install kernel -y
rpm -q kernel
grubby --info=ALL
sudo grubby --set-default-index=0
reboot
uname -r
```

---

## Project Structure (Example)

## Learning Outcome

After completing this lab you will understand:

* How Linux handles kernel upgrades safely
* How to install additional kernel versions
* How to manage bootloader kernel entries
* How to change the default kernel used during boot

These are essential skills for **Linux system administrators and DevOps engineers**.

---

## Real World Use Case

In production environments, administrators often install new kernels to:

* Apply security patches
* Enable new hardware support
* Improve performance and stability

Keeping previous kernels ensures that the system can still boot if the new kernel causes issues.

Administrators can then select the previous kernel from the **GRUB boot menu** to recover the system.

---

## Suggested Screenshots

Include the following screenshots for documentation:

* Current kernel version (`uname -r`)
* Kernel installation using `dnf`
* Installed kernels list (`rpm -q kernel`)
* Kernel entries from `grubby --info=ALL`
* Kernel version after reboot
