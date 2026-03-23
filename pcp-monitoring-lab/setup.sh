#!/bin/bash

echo "Installing PCP..."
dnf install pcp -y

echo "Starting PCP services..."
systemctl enable --now pmcd
systemctl enable --now pmlogger

echo "Checking status..."
systemctl status pmcd --no-pager
systemctl status pmlogger --no-pager

echo "PCP setup completed ✅"
