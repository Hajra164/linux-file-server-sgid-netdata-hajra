#!/bin/bash
echo "💾 AUTOMATED BACKUP SYSTEM"
echo "=========================="

# Create backups directory
mkdir -p ~/backups/samba

# Backup samba shares
rsync -av --delete /srv/samba/ ~/backups/samba/ 2>/dev/null
tar -czf ~/backups/file_server_$(date +%Y%m%d_%H%M).tar.gz -C ~/backups/samba .

# Show backup info
echo "✅ Latest backup: ~/backups/file_server_$(date +%Y%m%d_%H%M).tar.gz"
ls -lh ~/backups/ | tail -3
echo "=========================="
