#!/bin/bash

THRESHOLD=70
EMAIL="$USER"

cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
cpu_usage=${cpu_usage%.*}

if (( cpu_usage > THRESHOLD ))
then
    echo "CPU usage is high: $cpu_usage%" | mail -s "CPU Alert" $EMAIL
fi
