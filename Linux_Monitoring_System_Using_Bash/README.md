# Linux Resource Monitoring Script

## Objective

Create a Bash script that continuously monitors **CPU**, **Memory**, and **Disk** usage on a Linux system. The script displays real‑time usage statistics and triggers an alert when resource usage exceeds predefined threshold values.

This task demonstrates basic **Linux monitoring automation using Bash scripting**, which is an important skill for system administrators and DevOps engineers.

---

## Features

* Continuous monitoring using an infinite loop
* Tracks CPU usage
* Tracks memory usage
* Tracks disk usage
* Displays current system resource usage
* Sends alert messages when usage exceeds defined thresholds

---

## Threshold Configuration

The script uses threshold values to determine when to trigger alerts.

Example configuration:

```bash
CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=90
```

If usage exceeds these values, an alert message will be printed.

---

## Script

```bash
#!/bin/bash

CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=90

send_alert() {
  resource=$1
  value=$2
  echo "ALERT: $resource usage is high: $value%"
}

while true; do
  
  # Monitor CPU
  cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
  cpu_usage=${cpu_usage%.*}
  if ((cpu_usage >= CPU_THRESHOLD)); then
    send_alert "CPU" "$cpu_usage"
  fi

  # Monitor memory
  memory_usage=$(free | awk '/Mem/ {printf("%3.1f", ($3/$2) * 100)}')
  memory_usage=${memory_usage%.*}
  if ((memory_usage >= MEMORY_THRESHOLD)); then
    send_alert "Memory" "$memory_usage"
  fi

  # Monitor disk
  disk_usage=$(df -h / | awk '/\// {print $(NF-1)}')
  disk_usage=${disk_usage%?}
  if ((disk_usage >= DISK_THRESHOLD)); then
    send_alert "Disk" "$disk_usage"
  fi

  clear
  echo "Resource Usage:"
  echo "CPU: $cpu_usage%"
  echo "Memory: $memory_usage%"
  echo "Disk: $disk_usage%"

  sleep 2

done
```

---

## Code Explanation

### Shebang

```bash
#!/bin/bash
```

Tells the system to run the script using the Bash shell.

### Threshold Variables

```bash
CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=90
```

These variables define the usage percentage at which an alert should be triggered.

### Alert Function

```bash
send_alert() {
  resource=$1
  value=$2
  echo "ALERT: $resource usage is high: $value%"
}
```

This function prints an alert message when a resource exceeds the configured threshold.

### Infinite Monitoring Loop

```bash
while true; do
```

Creates an infinite loop so the script continuously monitors system resources.

### CPU Monitoring

```bash
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
```

* `top -bn1` runs the top command once in batch mode
* `grep "Cpu(s)"` extracts the CPU statistics line
* `awk '{print $2 + $4}'` calculates total CPU usage (user + system)

The script then compares the value with the threshold.

### Memory Monitoring

```bash
memory_usage=$(free | awk '/Mem/ {printf("%3.1f", ($3/$2) * 100)}')
```

* `free` displays memory statistics
* `awk` calculates the percentage of used memory

### Disk Monitoring

```bash
disk_usage=$(df -h / | awk '/\// {print $(NF-1)}')
```

* `df -h /` shows disk usage for the root filesystem
* `awk` extracts the usage percentage

### Alert Check

```bash
if ((cpu_usage >= CPU_THRESHOLD)); then
```

Compares the current usage with the defined threshold. If exceeded, the `send_alert` function is called.

### Display Current Usage

```bash
clear
echo "Resource Usage:"
```

Clears the terminal and prints the current system resource usage values.

### Sleep Interval

```bash
sleep 2
```

Pauses the script for 2 seconds before repeating the monitoring cycle.

---

## Steps to Run

1. Create a script file

```bash
nano monitor.sh
```

2. Paste the script code

3. Make the script executable

```bash
chmod +x monitor.sh
```

4. Run the script

```bash
./monitor.sh
```

---

## Expected Output

Example terminal output:

```
Resource Usage:
CPU: 25%
Memory: 41%
Disk: 62%
```

If a threshold is exceeded:

```
ALERT: CPU usage is high: 85%
```

---

## Learning Outcome

Through this task, the following concepts are practiced:

* Bash scripting
* Linux resource monitoring
* Automation with loops
* System performance observation
* Basic alerting mechanism

This type of monitoring logic is commonly used in production tools such as **Prometheus**, **Nagios**, and **Zabbix**.

---
