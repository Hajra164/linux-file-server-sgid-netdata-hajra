#!/bin/bash
echo "=== MONITORING DASHBOARD SETUP ==="

# 1. Node Exporter (CPU/RAM/Disk metrics)
echo "Installing Node Exporter..."
wget https://github.com/prometheus/node_exporter/releases/latest/download/node_exporter-linux-amd64.tar.gz
tar xzf node_exporter*.tar.gz
sudo mv node_exporter-*/node_exporter /usr/local/bin/
rm -rf node_exporter*

sudo useradd -rs /bin/false node_exporter
sudo tee /etc/systemd/system/node_exporter.service > /dev/null << EON
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=default.target
EON

sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl enable node_exporter

# 2. Grafana Dashboard
echo "Installing Grafana..."
sudo apt-get update
sudo apt-get install -y software-properties-common wget apt-transport-https
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
sudo apt-get update && sudo apt-get install grafana -y
sudo systemctl start grafana-server
sudo systemctl enable grafana-server

echo "✅ MONITORING READY!"
echo "Dashboard: http://localhost:3000 (admin/admin)"
echo "Node Exporter: http://localhost:9100/metrics"
