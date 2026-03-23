#!/bin/bash

# Show disks
lsblk

# Show disk usage
df -h

# Create mount directory
mkdir /mnt/data

# (Optional) Format disk (example: /dev/sdb)
# mkfs.ext4 /dev/sdb

# Mount disk
# mount /dev/sdb /mnt/data

# Verify
df -h
