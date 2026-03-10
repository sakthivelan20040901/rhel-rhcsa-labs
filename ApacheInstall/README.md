# RHCSA Lab – Install Apache and Allow NFS Access

## Objective
Install Apache web server and configure SELinux to allow Apache to access NFS mounted directories.

---

## Steps

1. Install Apache using yum
2. Start and enable the Apache service
3. Configure firewall to allow HTTP traffic
4. Enable SELinux boolean for NFS access
5. Verify Apache service is running

---

## Commands Used

```bash
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload
sudo setsebool -P httpd_use_nfs 1
getsebool httpd_use_nfs
