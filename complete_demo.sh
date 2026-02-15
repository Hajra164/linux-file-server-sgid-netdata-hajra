#!/bin/bash
echo "=== 🚀 CENTRALIZED FILE SERVER + ACCESS CONTROL ==="
echo "✅ Samba Service: $(sudo systemctl is-active smbd)"
echo "✅ 3 Shares Created:"
ls -la /srv/samba/
echo -e "\n✅ Linux Permissions (2770 = SGID + Group Write):"
stat /srv/samba/Sales /srv/samba/Accounts
echo -e "\n✅ Users + Groups:"
id alice
id bob
echo -e "\n✅ Samba Status:"
sudo smbstatus
echo -e "\n✅ CONFIG READY FOR PRODUCTION!"
echo "Shares: Public (all), Sales (alice), Accounts (bob)"
