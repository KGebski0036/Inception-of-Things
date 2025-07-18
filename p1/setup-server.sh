#!/bin/bash

# Install dependencies
sudo apt-get update
sudo apt-get install -y curl net-tools

sudo systemctl disable firewalld --now
sudo setenforce 0
sed -i 's/SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config

sudo uwf disable
sudo kill $( lsof -i:6443 -t )
sudo /usr/local/bin/k3s-uninstall.sh

# Install K3s in server mode
curl -sfL https://get.k3s.io | INSTLL_K3S_EXEC="server --node-ip 192.168.56.110 --write-kubeconfig-mode 0644 --token 12345" sh -s -

echo 'alias k="kubectl"' >> /home/vagrant/.bashrc
sudo chmod 777 /etc/rancher/k3s/k3s.yaml
source /home/vagrant/.bashrc
# Copy kubeconfig to vagrant user
# mkdir -p /home/vagrant/.kube
# sudo cp /etc/rancher/k3s/k3s.yaml /home/vagrant/.kube/config
# sudo chown -R vagrant:vagrant /home/vagrant/.kube

# Save join token to shared folder
# sudo cat /var/lib/rancher/k3s/server/node-token > /vagrant/node-token