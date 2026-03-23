#!/bin/bash

# Start firewall
systemctl start firewalld

# Enable firewall
systemctl enable firewalld

# Allow HTTP
firewall-cmd --permanent --add-service=http

# Reload firewall
firewall-cmd --reload

# Check rules
firewall-cmd --list-all
