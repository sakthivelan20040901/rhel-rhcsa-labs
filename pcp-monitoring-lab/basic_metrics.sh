#!/bin/bash

echo "CPU Usage:"
pmrep cpu.util

echo "Memory Usage:"
pmrep mem.util

echo "Disk Usage:"
pmrep disk.all.util

echo "Network Usage:"
pmrep network.interface.in.bytes
