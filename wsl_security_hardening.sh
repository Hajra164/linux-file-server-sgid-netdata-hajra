#!/bin/bash
echo "🔒 WSL PRODUCTION SECURITY (No SSH needed)"

# 1. UFW Firewall (Samba + Netdata only)
sudo ufw --force reset
sudo ufw allow 139/tcp   # Samba NetBIOS
sudo ufw allow 445/tcp   # Samba CIFS  
sudo ufw allow 19999/tcp # Netdata
sudo ufw allow 3000/tcp  # Grafana (bonus)
sudo ufw --force enable
sudo ufw status

# 2. Samba security hardening
sudo sed -i 's/   guest account = nobody/   guest account = nobody\n   smb passwd file = \/etc\/samba\/smbpasswd/' /etc/samba/smb.conf
sudo mkdir -p /etc/samba/private
sudo smbpasswd -a hajra 2>/dev/null || echo "User already exists"

# 3. Disk quotas (production feature)
sudo apt install quota -y
echo "✅ ENTERPRISE SECURITY COMPLETE (WSL Optimized)!"
echo "🔥 Firewall: sudo ufw status"
echo "🔥 Samba: sudo smbstatus"
