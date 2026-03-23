#!/bin/bash

# Install Cockpit
dnf install cockpit -y

# Start and enable Cockpit
systemctl enable --now cockpit

# Disable firewall (lab purpose)
systemctl stop firewalld
setenforce 0

echo "Cockpit installed. Access: https://<server-ip>:9090"
