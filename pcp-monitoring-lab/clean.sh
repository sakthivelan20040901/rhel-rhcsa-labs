#!/bin/bash

echo "Stopping stress processes..."
killall yes 2>/dev/null

echo "Stopping PCP services..."
systemctl stop pmcd
systemctl stop pmlogger

echo "Cleanup done ✅"
