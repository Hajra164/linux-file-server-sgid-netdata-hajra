#!/bin/bash
echo "🔒 PRODUCTION SECURITY FIREWALL"

# 1. UFW Firewall (only Samba + dashboards)
sudo ufw allow 22/tcp    # SSH
sudo ufw allow 139/tcp   # Samba
sudo ufw allow 445/tcp   # Samba
sudo ufw allow 19999/tcp # Netdata
sudo ufw --force enable
sudo ufw status

# 2. Fail2ban (block brute force attacks)
sudo apt install fail2ban -y
sudo systemctl enable fail2ban

# 3. SSH hardening
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo systemctl restart ssh

echo "✅ ENTERPRISE SECURITY COMPLETE!"
