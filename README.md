# Linux File Server with SGID Permissions & Netdata Monitoring


## INTRODUCTION

### 1.1)  Project Background:

Modern organizations require secure, scalable file sharing solutions with granular access control. This project implements a production-grade Linux file server using Samba for Windows compatibility and Netdata for real-time monitoring.

### 1.2) Objectives:

Deploy 3-department file shares with access isolation.
Implement 2770 SGID permissions for group inheritance.
Integrate Netdata for 1-second performance metrics.
Automate daily backups with retention policy.
Demonstrate enterprise security hardening.

### 1.3) Scope:

Ubuntu WSL/Linux server (172.31.21.160)
3 Samba shares: Public/Sales/Accounts
Real-time monitoring dashboard
Windows client compatibility.

## 2: SYSTEM REQUIREMENTS

| Component | Specification                     |
| --------- | --------------------------------- |
| OS        | Ubuntu 22.04 LTS (WSL/VirtualBox) |
| RAM       | 2GB minimum                       |
| Disk      | 20GB (including backups)          |
| Network   | Static IP: 172.31.21.160          |
| Clients   | Windows 10/11, Linux SMB clients  |


Required Packages:
bash:    samba netdata cron curl tar

## 3. INSTALLATION & CONFIGURATION
 
### 3.1 Base System Setup:

Update system
sudo apt update && sudo apt upgrade -y

Install core packages
sudo apt install samba netdata cron curl tar -y

Create backup directory
sudo mkdir -p /backup /srv/samba


### 3.2 Directory Structure:

sudo mkdir -p /srv/samba/{Public,Sales,Accounts}
sudo chown nobody:nogroup /srv/samba/Public
sudo chmod 777 /srv/samba/Public

## 4. PROJECT ARCHITECTURE DIAGRAM:
<img width="1027" height="606" alt="diagram-export-15-02-2026-18_06_40" src="https://github.com/user-attachments/assets/dc0641a6-d96d-4334-8e34-782c56b96f3b" />

## Screenshots:
<img width="1110" height="621" alt="image" src="https://github.com/user-attachments/assets/3d880b14-bfe9-46d0-89f5-9049d47ddb42" />
### fig: samba file server details

<img width="1600" height="738" alt="image" src="https://github.com/user-attachments/assets/1b22e68c-59bf-4f28-b1d7-ca878002ae4d" />
### fig: Netdata Dashboard 


## 5. SECURITY FEATURES:
| Feature           | Status | Implementation              |
| ----------------- | ------ | --------------------------- |
| 2770 SGID         | ✅      | Automatic group inheritance |
| Samba ACL         | ✅      | valid users = hajra         |
| Guest Mapping     | ✅      | map to guest = bad user     |
| File Permissions  | ✅      | 777 Public, 2770 restricted |
| Backup Encryption | 🔄     | Planned (gpg)               |
| Firewall          | 🔄     | ufw (ports 445,19999)       |


## 6.INSTALLATION & CONFIGURATION:

### 6.1 Base System Setup
Update system
sudo apt update && sudo apt upgrade -y

Install core packages
sudo apt install samba netdata cron curl tar -y

Create backup directory
sudo mkdir -p /backup /srv/samba

### 6.2 Directory Structure
sudo mkdir -p /srv/samba/{Public,Sales,Accounts}
sudo chown nobody:nogroup /srv/samba/Public
sudo chmod 777 /srv/samba/Public

## 7. NETDATA MONITORING:

### 7.1 Installation & Startup
bash
Auto-starts on install
sudo systemctl enable --now netdata

Verify service
sudo systemctl status netdata
### 7.2 Dashboard Access

Browser: http://localhost:19999
Network: http://172.31.21.160:19999

### 7.3 Monitored Metrics

CPU: Per-core usage, load average

RAM: Memory, swap, OOM kills

Disk: I/O, filesystem usage

Network: Bandwidth, connections

Samba: Active sessions, file operations

## 8. CONCLUSION & FUTURE WORK:

### 13.1 Achievements
✅ Production file server with 3-department isolation
✅ Real-time monitoring (Netdata dashboard)
✅ Automated backups with retention policy
✅ 2770 SGID security + Samba ACLs
✅ Windows/Linux client compatibility

### 13.2 Future Enhancements:

Disk quotas per department

LDAP/Active Directory integration

SSL encryption for SMB3

Grafana dashboards

High availability (DRBD)

### 13.3 Learning Outcomes:

Linux permissions mastery (SGID bit)

Samba enterprise configuration

Real-time monitoring implementation

Production backup strategies

Access control matrix design


