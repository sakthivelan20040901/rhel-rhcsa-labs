# 🖥️ Linux Admin Tasks using Cockpit (CLI Version)

## 🚀 Project Overview

This project demonstrates **essential Linux system administration tasks** using **command-line tools**, inspired by features available in the Cockpit web console.

Instead of using a graphical interface, all tasks are performed via CLI to build **strong real-world Linux and DevOps skills**.

---

## 🎯 Objectives

* Learn core Linux administration tasks
* Understand how Cockpit functionalities work internally
* Practice real-world server management using CLI
* Build a strong foundation for DevOps and system administration roles

---

## 🧠 What is Cockpit?

Cockpit is a web-based interface used to manage Linux systems.

This project replicates those functionalities using:

* Shell scripting
* Linux commands

👉 This helps you move from **GUI-based understanding → CLI mastery**

---

## 📁 Project Structure

```
cockpit-linux-admin-lab/
 ├── setup.sh         # Install and configure Cockpit environment
 ├── services.sh      # Manage system services
 ├── users.sh         # User creation and permission management
 ├── network.sh       # Network configuration and hostname setup
 ├── storage.sh       # Disk and storage management
 ├── firewall.sh      # Firewall configuration
 ├── webserver.sh     # Apache web server setup (mini project)
 ├── monitoring.sh    # System performance monitoring
 └── README.md        # Project documentation
```

---

## ⚙️ Prerequisites

* Linux system (Recommended: Red Hat Enterprise Linux / CentOS / Rocky Linux)
* Root or sudo access
* Basic knowledge of terminal commands

---

## 🔧 Setup Instructions

Make all scripts executable:

```bash
chmod +x *.sh
```

Run initial setup:

```bash
bash setup.sh
```

---

## 🛠️ Tasks and Explanation

### 📊 1. System Monitoring (`monitoring.sh`)

Monitor system performance such as:

* CPU usage
* Memory usage
* Disk space
* Running processes

👉 Helps in identifying performance bottlenecks

---

### ⚙️ 2. Service Management (`services.sh`)

Manage system services using `systemctl`:

* Start / Stop / Restart services
* Enable services at boot

👉 Example: Managing SSH or web server services

---

### 👤 3. User Management (`users.sh`)

Perform user-related operations:

* Create users
* Set passwords
* Assign sudo privileges

👉 Useful for managing access control

---

### 🌐 4. Network Configuration (`network.sh`)

Configure basic networking:

* View IP address
* Change hostname
* Restart network services

👉 Important for server connectivity

---

### 💽 5. Storage Management (`storage.sh`)

Handle disk-related tasks:

* View disk partitions
* Monitor disk usage
* Mount storage devices

👉 Helps manage server storage efficiently

---

### 🔐 6. Firewall Management (`firewall.sh`)

Control system security:

* Start/enable firewall
* Allow services (HTTP, SSH)
* Reload firewall rules

👉 Protects system from unauthorized access

---

### 🌍 7. Web Server Setup (`webserver.sh`)

Mini project to deploy a web server:

* Install Apache (`httpd`)
* Start and enable service
* Create a test webpage
* Configure firewall

👉 Simulates real-world deployment task

---

## ▶️ Usage

Run scripts individually based on task:

```bash
bash setup.sh
bash services.sh
bash users.sh
bash network.sh
bash storage.sh
bash firewall.sh
bash webserver.sh
bash monitoring.sh
```

---

## 🔥 Real-World Use Cases

* Server setup and maintenance
* Troubleshooting system issues
* Managing users and permissions
* Deploying web applications
* Monitoring system health

---

## 💡 Key Learnings

* Linux command-line proficiency
* System administration fundamentals
* Service and process management
* Networking and security basics
* DevOps foundational skills

---

## 🚀 Future Improvements

* Add automation scripts (cron jobs)
* Integrate logging and alert system
* Combine with PXE and Kickstart automation
* Add monitoring with PCP

---

## 👨‍💻 Author

**Sakthivelan**
Aspiring DevOps Engineer | Linux Enthusiast

---

## ⭐ Conclusion

This project bridges the gap between **GUI-based management (Cockpit)** and **CLI-based administration**, helping you gain practical, job-ready Linux skills.

---
