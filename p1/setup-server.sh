#!/bin/bash
set -e

# Install curl and dependencies
apt-get update && apt-get install -y curl

# Install K3s in server mode
curl -sfL https://get.k3s.io | sh -

# Set up kubectl for vagrant user
mkdir -p /home/vagrant/.kube
cp /etc/rancher/k3s/k3s.yaml /home/vagrant/.kube/config
chown -R vagrant:vagrant /home/vagrant/.kube

# Print node token for joining
echo "Node token: $(cat /var/lib/rancher/k3s/server/node-token)"
