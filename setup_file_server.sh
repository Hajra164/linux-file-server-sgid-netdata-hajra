#!/bin/bash
echo "=== 1. COMPANY STRUCTURE ==="
sudo mkdir -p /srv/samba/{Public,Sales,Accounts}
sudo groupadd -r sales && sudo groupadd -r accounts

echo "=== 2. USERS & PASSWORDS ==="
sudo useradd -m -G sales alice -s /bin/bash
sudo useradd -m -G accounts bob -s /bin/bash
echo "alice:password123" | sudo chpasswd
echo "bob:password123" | sudo chpasswd

echo "=== 3. LINUX PERMISSIONS ==="
sudo chown :sales /srv/samba/Sales && sudo chmod 2770 /srv/samba/Sales
sudo chown :accounts /srv/samba/Accounts && sudo chmod 2770 /srv/samba/Accounts  
sudo chmod 0777 /srv/samba/Public

echo "=== 4. SAMBA CONFIG ==="
sudo bash -c 'cat > /etc/samba/smb.conf << EOC
[global]
   workgroup = WORKGROUP
   server string = Company File Server
   security = user

[Public]
   path = /srv/samba/Public
   writable = yes
   browsable = yes
   guest ok = yes

[Sales]
   path = /srv/samba/Sales
   writable = yes
   browsable = yes
   valid users = alice

[Accounts]
   path = /srv/samba/Accounts
   writable = yes
   browsable = yes
   valid users = bob
EOC'

echo "=== 5. SAMBA USERS + START ==="
sudo smbpasswd -a alice <<< "password123"
sudo smbpasswd -a bob <<< "password123"  
sudo systemctl restart smbd nmbd
sudo systemctl enable smbd nmbd

echo "✅ FILE SERVER READY!"
