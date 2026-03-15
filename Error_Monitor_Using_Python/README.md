# Linux Log Monitoring & Email Alert System (Python)

## Project Overview

This project implements a **Linux log monitoring and alert system using Python**. The script scans important Linux system log files and sends an **email alert whenever an error, failure, or critical event is detected**.

The goal is to simulate the basic functionality of enterprise monitoring tools by automatically detecting problems in system logs and notifying administrators.

---

## Key Features

* Monitor Linux system log files
* Detect error keywords automatically
* Send email alerts when issues occur
* Lightweight monitoring using Python
* Easy automation using cron scheduler

---

## Logs Monitored

Linux stores most logs inside:

```
/var/log/
```

Common logs that can be monitored:

| Log File                 | Description          |
| ------------------------ | -------------------- |
| /var/log/messages        | General system logs  |
| /var/log/secure          | Authentication logs  |
| /var/log/syslog          | System activity logs |
| /var/log/cron            | Cron job logs        |
| /var/log/httpd/error_log | Apache server errors |

---

## Error Keywords Detected

The script checks for common failure indicators such as:

```
error
failed
critical
panic
denied
```

When one of these appears in the log file, an email alert is triggered.

---

## Requirements

Create a `requirements.txt` file with the following dependency:

```
psutil
```

Install dependencies:

```bash
pip3 install -r requirements.txt
```

Note: The Python standard libraries used (`smtplib`, `email`, `os`) are included with Python and do not need installation.

---

## Python Monitoring Script

Example script:

```python
import smtplib
from email.mime.text import MIMEText

LOG_FILE = "/var/log/messages"

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


with open(LOG_FILE) as f:
    logs = f.readlines()

for line in logs:

    if "error" in line.lower() or "failed" in line.lower():

        print("Alert detected:", line)

        send_email(
            "SYSTEM ERROR ALERT",
            f"Error detected in system logs:\n\n{line}"
        )

        break
```

---

## Running the Script

Run manually:

```bash
python3 log_alert.py
```

---

## Automating with Cron

Open the cron editor:

```bash
crontab -e
```

Add the following line to run the script every 10 minutes:

```
*/10 * * * * python3 /path/to/log_alert.py
```

This ensures the system checks logs regularly without running continuously.

---

## Gmail App Password Setup

To allow Python to send email through Gmail:

1. Enable **2-Step Verification** in your Google account.
2. Go to **Security → App Passwords**.
3. Generate a new password for "Mail".
4. Use the generated password in the script.

Example:

```
EMAIL_PASSWORD="your_generated_app_password"
```

---

## Project Structure

```
linux-log-alert-system
│
├── log_alert.py
├── requirements.txt
└── README.md
```

---

## Real World Equivalent

This project demonstrates the core idea behind enterprise monitoring tools such as:

* Nagios
* Zabbix
* ELK Stack
* Wazuh
* Splunk

These systems analyze logs continuously and trigger alerts when anomalies or failures occur.

---

## Learning Outcomes

After completing this project you will understand:

* Linux log file structure
* Python-based system monitoring
* Email alert automation
* Log-based debugging techniques

These skills are highly valuable for **Linux administrators, DevOps engineers, and security monitoring systems**.

---

## Future Improvements

Possible enhancements:

* Monitor multiple log files automatically
* Detect repeated login failures
* Send alerts to Slack or Telegram
* Build a real-time log monitoring system
* Add a dashboard for log visualization
