#!/bin/bash

# Show IP
ip a

# Change hostname
hostnamectl set-hostname devops-server

# Verify hostname
hostnamectl

# Restart network
systemctl restart NetworkManager
