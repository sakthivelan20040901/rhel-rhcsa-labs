#!/bin/bash

# CPU usage
top -b -n1 | head -20

# Memory usage
free -m

# Disk usage
df -h

# Running processes
ps aux | head -10
