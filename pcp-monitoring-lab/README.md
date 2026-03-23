# 📊 PCP Monitoring Lab (RHEL / CentOS)

## 🚀 Project Overview

This project demonstrates **system performance monitoring and analysis** using **Performance Co-Pilot (PCP)** on Linux systems.

PCP is a powerful monitoring framework available in **Red Hat Enterprise Linux (RHEL)** and CentOS that provides:

* Real-time system metrics
* Historical performance data
* Advanced performance analysis

This lab simulates **real-world Linux Admin and DevOps tasks** such as monitoring CPU usage, analyzing system load, and debugging performance issues.

---

## 🧠 What is Performance Co-Pilot (PCP)?

Performance Co-Pilot (PCP) is a **system performance monitoring toolkit** that helps administrators:

* Collect system metrics (CPU, memory, disk, network)
* Store historical performance data
* Analyze system behavior over time
* Troubleshoot performance bottlenecks

Unlike traditional tools like `top`, PCP allows both:
✔ Real-time monitoring
✔ Historical analysis

---

## 🎯 Objectives of This Project

* Understand PCP architecture and components
* Monitor system performance in real-time
* Enable and analyze historical logs
* Simulate system load for testing
* Perform performance troubleshooting

---

## 🏗️ Architecture Overview

```
System Metrics
     ↓
pmcd (Performance Metrics Collector)
     ↓
pmlogger (Stores Historical Data)
     ↓
Analysis Tools (pmrep, pminfo)
     ↓
Visualization (CLI / Cockpit / Grafana)
```

---

## 📁 Project Structure

```
pcp-monitoring-lab/
 ├── setup.sh            # Install and configure PCP
 ├── basic_metrics.sh    # Real-time monitoring
 ├── logging.sh          # Enable historical logging
 ├── analysis.sh         # Analyze past performance
 ├── stress_test.sh      # Generate CPU load
 ├── cleanup.sh          # Stop services and cleanup
 └── README.md           # Project documentation
```

---

## ⚙️ Prerequisites

* RHEL / CentOS / Rocky Linux system
* Root or sudo access
* Internet connection (for package installation)

---

## 🔧 Installation & Setup

Run the setup script:

```bash
chmod +x *.sh
bash setup.sh
```

### What this does:

* Installs PCP packages
* Starts `pmcd` (metrics collector)
* Starts `pmlogger` (logging service)

---

## 📊 Real-Time Monitoring

Run:

```bash
bash basic_metrics.sh
```

### Metrics Covered:

* CPU utilization
* Memory usage
* Disk activity
* Network traffic

### Example:

```bash
pmrep cpu.util
```

---

## 📅 Enable Historical Logging

Run:

```bash
bash logging.sh
```

### What happens:

* Starts `pmlogger`
* Stores logs in:

  ```
  /var/log/pcp/pmlogger/
  ```

---

## 🔍 Performance Analysis

Run:

```bash
bash analysis.sh
```

### Features:

* View available logs
* Analyze past CPU and memory usage

### Example:

```bash
pmrep -a cpu.util
```

👉 `-a` = archived (historical data)

---

## 🧪 Stress Testing (Simulating Load)

Run:

```bash
bash stress_test.sh
```

### What it does:

* Generates CPU load using:

  ```bash
  yes > /dev/null
  ```

### Purpose:

* Test monitoring tools
* Simulate real server conditions

### Stop stress:

```bash
killall yes
```

---

## 🧹 Cleanup

Run:

```bash
bash cleanup.sh
```

### This will:

* Stop stress processes
* Stop PCP services

---

## 🔄 Full Workflow

```bash
bash setup.sh
bash basic_metrics.sh
bash stress_test.sh
bash analysis.sh
bash cleanup.sh
```

---

## 🔥 Real-World Use Cases

* Debug high CPU usage issues
* Analyze memory leaks
* Monitor disk performance
* Perform capacity planning
* Investigate server slowdowns

---

## 🔗 Integration with Cockpit

PCP works behind the scenes with **Cockpit Web Console**:

* Cockpit dashboards use PCP metrics
* Provides graphical visualization of system data

---

## ⚖️ PCP vs Traditional Tools

| Tool | Capability                        |
| ---- | --------------------------------- |
| top  | Real-time only                    |
| htop | Interactive UI                    |
| PCP  | Real-time + historical + analysis |

---

## 💡 Key Learnings

* System performance monitoring
* Linux administration skills
* Observability fundamentals
* Debugging real-world issues
* DevOps monitoring concepts

---

## 🚀 Future Enhancements

* Integrate with Grafana dashboards
* Automate monitoring alerts
* Monitor multiple systems
* Combine with Cockpit UI
* Integrate with DevOps pipelines

---

## 👨‍💻 Author

**Sakthivelan**
Linux & DevOps Enthusiast

---

## ⭐ Conclusion

This project provides a **hands-on understanding of Linux performance monitoring** using PCP and prepares you for real-world system administration and DevOps roles.

---
