#!/bin/bash

# Install dependencies
sudo apt-get update
sudo apt-get install -y curl net-tools

sudo iptables -F
sudo iptables -X
sudo iptables -t nat -F
sudo iptables -t nat -X

# Remove K3s if already installed
if [ -f /usr/local/bin/k3s-uninstall.sh ]; then
    sudo /usr/local/bin/k3s-uninstall.sh
fi

# Install K3s in agent mode
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="agent --server https://192.168.56.110:6443 --node-ip 192.168.56.110 --token 12345" sh -s -

echo "Done"
