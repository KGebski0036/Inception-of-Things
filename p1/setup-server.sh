#!/bin/bash

# Install dependencies
sudo apt-get update
sudo apt-get install -y curl net-tools

sudo iptables -F
sudo iptables -X
sudo iptables -t nat -F
sudo iptables -t nat -X

if [ -f /usr/local/bin/k3s-uninstall.sh ]; then
    sudo /usr/local/bin/k3s-uninstall.sh
fi

# Install K3s in server mode
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server --node-ip 192.168.56.110 --write-kubeconfig-mode 0644 --token 12345" sh -s -

mkdir -p /home/vagrant/.kube
sudo cp /etc/rancher/k3s/k3s.yaml /home/vagrant/.kube/config
sudo chown -R vagrant:vagrant /home/vagrant/.kube
sudo chmod 644 /home/vagrant/.kube/config

echo 'alias k="kubectl"' >> /home/vagrant/.bashrc

source /home/vagrant/.bashrc

echo "K3s server setup complete."
