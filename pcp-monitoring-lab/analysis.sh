#!/bin/bash

echo "Available logs:"
pmlogger_check

echo "Analyzing CPU history:"
pmrep -a cpu.util

echo "Analyzing Memory history:"
pmrep -a mem.util
