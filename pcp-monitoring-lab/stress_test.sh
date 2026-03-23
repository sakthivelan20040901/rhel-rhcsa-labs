#!/bin/bash

echo "Starting CPU stress test..."

yes > /dev/null &

echo "Process started. PID:"
jobs -l

echo "Monitor using: pmrep cpu.util"
echo "To stop: killall yes"
