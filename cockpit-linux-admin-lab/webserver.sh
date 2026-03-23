#!/bin/bash

# Install Apache
dnf install httpd -y

# Start service
systemctl start httpd

# Enable at boot
systemctl enable httpd

# Create test page
echo "Hello from DevOps Server" > /var/www/html/index.html

# Allow HTTP in firewall
firewall-cmd --permanent --add-service=http
firewall-cmd --reload

# Check status
systemctl status httpd
