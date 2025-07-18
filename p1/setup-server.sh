#!/bin/bash

# Install dependencies
sudo apt-get update
sudo apt-get install -y curl

# Install K3s in server mode
curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644

# Copy kubeconfig to vagrant user
mkdir -p /home/vagrant/.kube
sudo cp /etc/rancher/k3s/k3s.yaml /home/vagrant/.kube/config
sudo chown -R vagrant:vagrant /home/vagrant/.kube

# Save join token to shared folder
sudo cat /var/lib/rancher/k3s/server/node-token > /vagrant/node-token