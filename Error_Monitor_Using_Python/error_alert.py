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

        print("Error detected:", line)

        send_email(
            "SYSTEM ERROR ALERT",
            f"Error detected in system log:\n\n{line}"
        )

        break
