#!/bin/bash

# Install dependencies
sudo apt-get update
sudo apt-get install -y curl net-tools

sudo systemctl disable firewalld --now
sudo setenforce 0
sed -i 's/SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config
sudo /usr/local/bin/k3s-uninstall.sh
# Read token from shared folder
export TKN=$(cat /vagrant/token)

# Install K3s in agent mode
curl -sfL https://get.k3s.io | INSTLL_K3S_EXEC="agent --server https://192.168.56.110:6443 --node-ip 192.168.56.110 --token 12345" sh -s -
echo "Done"
