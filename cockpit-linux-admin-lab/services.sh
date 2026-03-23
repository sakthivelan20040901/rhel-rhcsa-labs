#!/bin/bash

# Restart SSH service
systemctl restart sshd

# Stop SSH service
systemctl stop sshd

# Start SSH service
systemctl start sshd

# Enable service at boot
systemctl enable sshd

# Check status
systemctl status sshd
