# Linux Monitoring & Email Alert System (Python)

## Introduction

This project demonstrates a **simple Linux monitoring and alert system built using Python**. The script checks system resources such as CPU usage and sends an **email alert when the usage exceeds a defined threshold**.

The monitoring script is scheduled using **cron**, allowing it to run at specific intervals instead of continuously consuming system resources.

---

## Objective

The goal of this project is to:

* Monitor Linux system resources using Python
* Send email alerts when thresholds are exceeded
* Automate the monitoring task using cron
* Understand how real monitoring systems work

---

## Technologies Used

* Python
* psutil (system monitoring library)
* smtplib (email sending)
* Linux cron scheduler

---

## Project Architecture

```
Linux Server
      ↓
Python Monitoring Script
      ↓
Check CPU / Memory / Disk
      ↓
If Threshold Exceeded
      ↓
Send Email Alert
```

---

## Install Required Python Package

Install the monitoring library:

```bash
pip3 install psutil
```

---

## Python Monitoring Script

Example script:

```python
import psutil
import smtplib
from email.mime.text import MIMEText

CPU_THRESHOLD = 80

EMAIL_FROM = "your_email@gmail.com"
EMAIL_TO = "your_email@gmail.com"
EMAIL_PASSWORD = "APP_PASSWORD"

SMTP_SERVER = "smtp.gmail.com"
SMTP_PORT = 587


def send_email(subject, message):

    msg = MIMEText(message)
    msg["Subject"] = subject
    msg["From"] = EMAIL_FROM
    msg["To"] = EMAIL_TO

    server = smtplib.SMTP(SMTP_SERVER, SMTP_PORT)
    server.starttls()
    server.login(EMAIL_FROM, EMAIL_PASSWORD)
    server.sendmail(EMAIL_FROM, EMAIL_TO, msg.as_string())
    server.quit()


cpu = psutil.cpu_percent(interval=1)

print(f"CPU Usage: {cpu}%")

if cpu > CPU_THRESHOLD:
    send_email("CPU ALERT", f"CPU usage is high: {cpu}%")
```

---

## Running the Script Manually

```bash
python3 system_alert.py
```

---

## Scheduling the Script with Cron

Open the cron editor:

```bash
crontab -e
```

Add the following line:

```
*/10 * * * * python3 /path/to/system_alert.py
```

This runs the monitoring script **every 10 minutes**.

---

## Why Use Cron Instead of Continuous Script?

Running the script with cron is more efficient because:

* Lower CPU and memory usage
* Script runs only when needed
* Easy to manage and maintain
* Common practice in Linux server administration

Continuous monitoring scripts (`while True`) consume system resources and are usually used only by specialized monitoring agents.

---

## Real World Equivalent

This project demonstrates the basic concept behind enterprise monitoring tools such as:

* Prometheus
* Nagios
* Zabbix
* Grafana Alertmanager

These systems continuously collect metrics and trigger alerts when thresholds are exceeded.

---

## Project Structure

```
linux-alert-system
│
├── system_alert.py
├── requirements.txt
└── README.md
```

---

## Learning Outcome

After completing this project you will understand:

* Linux resource monitoring
* Python automation for system administration
* Email alert systems
* Cron-based scheduling

These skills are useful for **Linux administrators, DevOps engineers, and system monitoring automation**.

---

## Generate Gmail App Password

To allow the Python script to send emails through Gmail, you must use a **Google App Password** instead of your normal Gmail password.

### Step 1 – Enable 2‑Step Verification

1. Go to your Google Account settings.
2. Navigate to **Security**.
3. Enable **2‑Step Verification**.

Link: [https://myaccount.google.com/security](https://myaccount.google.com/security)

### Step 2 – Create an App Password

1. In the **Security** section, open **App Passwords**.
2. Select **Mail** as the app.
3. Select **Other / Custom device** and give a name like `linux-alert-system`.
4. Click **Generate**.

Google will generate a 16‑character password like:

```
abcd efgh ijkl mnop
```

### Step 3 – Use the App Password in the Script

Replace the password in your Python script:

```python
EMAIL_PASSWORD = "YOUR_APP_PASSWORD"
```

⚠️ **Important:** Never share your real email password in code repositories. Use environment variables or configuration files for better security.

---

## Suggested Improvements

Future improvements for this project:

* Add memory and disk alerts
* Add logging system
* Send alerts to Slack or Telegram
* Convert script into a systemd service
