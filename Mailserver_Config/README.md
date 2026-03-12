# Linux CPU Monitoring and Email Alert System

## Introduction

This project demonstrates how to monitor system CPU usage on a Linux server and automatically send an email alert when the usage exceeds a predefined threshold. The implementation uses **Bash scripting**, **Postfix mail server**, and **cron scheduling**.

This is a simplified example of how real monitoring systems notify administrators when system resources become critical.

---

## Objective

The goal of this project is to:

* Install and configure the Postfix mail server
* Create a Bash script to monitor CPU usage
* Send email alerts when CPU usage exceeds a defined threshold
* Automate monitoring using cron

---

## Architecture

```
CPU Monitoring Script
        ↓
Check CPU Usage
        ↓
Compare with Threshold
        ↓
Send Email Alert using Postfix
        ↓
Administrator Receives Notification
```

---

## Prerequisites

* Linux system (RHEL / CentOS / Rocky / Fedora)
* Root or sudo access
* Internet connectivity

---

## Step 1 – Install Postfix Mail Server

Install postfix and mail client:

```bash
sudo dnf install postfix mailx -y
```

Start the postfix service:

```bash
sudo systemctl start postfix
```

Enable postfix at system boot:

```bash
sudo systemctl enable postfix
```

Verify service status:

```bash
systemctl status postfix
```

---

## Step 2 – Configure Postfix

Edit the main configuration file:

```bash
sudo vim /etc/postfix/main.cf
```

Ensure the following configuration exists:

```
myhostname = localhost
myorigin = $myhostname
inet_interfaces = loopback-only
mydestination = $myhostname, localhost
```

Restart postfix after configuration:

```bash
sudo systemctl restart postfix
```

---

## Step 3 – Test Mail Delivery

Send a test email:

```bash
echo "Test email from server" | mail -s "Test Mail" $USER
```

Check received email:

```bash
mail
```

---

## Step 4 – Create CPU Monitoring Script

Create the script file:

```bash
nano cpu_monitor.sh
```

Add the following script:

```bash
#!/bin/bash

THRESHOLD=70
EMAIL="$USER"

cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
cpu_usage=${cpu_usage%.*}

if (( cpu_usage > THRESHOLD ))
then
    echo "CPU usage is high: $cpu_usage%" | mail -s "CPU Alert" $EMAIL
fi
```

Make the script executable:

```bash
chmod +x cpu_monitor.sh
```

---

## Step 5 – Automate Monitoring Using Cron

Open the cron editor:

```bash
crontab -e
```

Add the following line to run the script every minute:

```
*/1 * * * * /home/USERNAME/cpu_monitor.sh
```

Replace `USERNAME` with your system username.

---

## Step 6 – Simulate High CPU Usage

Run the following command to increase CPU load:

```bash
yes > /dev/null &
```

Once CPU usage exceeds the threshold, the script will send an email alert.

---

## Expected Output

Example email alert:

```
Subject: CPU Alert

CPU usage is high: 92%
```

---

## Learning Outcomes

After completing this project you will understand:

* Linux resource monitoring using Bash
* Mail server configuration with Postfix
* Automated alerting mechanisms
* Cron job scheduling
* Basic DevOps monitoring workflow

---

## Real World Use Case

In production environments, monitoring systems detect issues such as:

* High CPU usage
* Low disk space
* Memory exhaustion

When these conditions occur, alert systems send notifications to administrators via email or messaging platforms.

Popular monitoring tools that use similar alerting concepts include:

* Prometheus
* Nagios
* Zabbix
* Grafana Alertmanager

This project demonstrates the fundamental concept behind those systems.

---
