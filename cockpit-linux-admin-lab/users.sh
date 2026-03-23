#!/bin/bash

# Create user
useradd devuser

# Set password
echo "devuser:password123" | chpasswd

# Add to sudo group
usermod -aG wheel devuser

# Verify
id devuser
