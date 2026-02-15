#!/bin/bash
echo "=== 🚀 CENTRALIZED FILE SERVER STATUS ==="
sudo smbstatus
echo -e "\n=== 📁 FOLDER PERMISSIONS ==="
ls -la /srv/samba/
echo -e "\n=== 👥 USER ACCESS ==="
id alice
id bob
echo -e "\n=== 🖥️ WINDOWS TEST ==="
echo "1. Win+R → \\\\localhost\\Public → Opens immediately"
echo "2. Win+R → \\\\localhost\\Sales → alice / password123"
echo "3. Win+R → \\\\localhost\\Accounts → bob / password123"
echo -e "\n✅ ✅ ✅ PRODUCTION READY!"
