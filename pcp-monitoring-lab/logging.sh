#!/bin/bash

echo "Starting PCP logging..."

systemctl start pmlogger
systemctl enable pmlogger

echo "Log directory:"
ls /var/log/pcp/pmlogger/

echo "Logging enabled ✅"
