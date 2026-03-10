# RHCSA Lab 02 – Setup Network Parameters

## Objective

Configure a network connection with a **static IP address**, **gateway**, and **DNS server** using the `nmcli` command.

This is a common task performed by Linux system administrators to configure server network settings.

---

## Steps

1. Check available network interfaces
2. Scan available WiFi networks
3. Create a new network connection
4. Configure static IP address
5. Set gateway and DNS server
6. Activate the connection
7. Verify network configuration

---

## Commands Used

```bash
nmcli device status

nmcli device wifi list

nmcli conn add type wifi ifname wlp6s0 con-name SAKTHIVELAN ssid SAKTHIVELAN

nmcli con modify SAKTHIVELAN \
ipv4.addresses 192.168.1.100/24 \
ipv4.gateway 192.168.1.1 \
ipv4.dns 8.8.8.8 \
ipv4.method manual

nmcli con up SAKTHIVELAN

nmcli con show --active

ip a
```

---

## Result

✔ Successfully created a network connection
✔ Configured static IP address
✔ Set gateway and DNS server
✔ Verified the active network configuration
