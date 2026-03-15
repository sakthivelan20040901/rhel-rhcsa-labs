import psutil
import smtplib
from email.mime.text import MIMEText
import time

# Thresholds
CPU_THRESHOLD = 10
MEMORY_THRESHOLD = 20
DISK_THRESHOLD = 50

# Email configuration
EMAIL_FROM = "from.example@gmail.com"
EMAIL_TO = "to.example@gmail.com"
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

while True:

    cpu = psutil.cpu_percent(interval=1)
    memory = psutil.virtual_memory().percent
    disk = psutil.disk_usage('/').percent

    print(f"CPU: {cpu}%  Memory: {memory}%  Disk: {disk}%")

    if cpu > CPU_THRESHOLD:
        send_email(
            "CPU ALERT",
            f"CPU usage is high: {cpu}%"
        )

    if memory > MEMORY_THRESHOLD:
        send_email(
            "MEMORY ALERT",
            f"Memory usage is high: {memory}%"
        )

    if disk > DISK_THRESHOLD:
        send_email(
            "DISK ALERT",
            f"Disk usage is high: {disk}%"
        )
    time.sleep(5)
