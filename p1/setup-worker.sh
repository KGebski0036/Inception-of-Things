#!/bin/bash
set -e

# Install curl and dependencies
apt-get update && apt-get install -y curl

# Join K3s cluster as an agent
SERVER_IP="192.168.56.110"
NODE_TOKEN=$(ssh -o StrictHostKeyChecking=no vagrant@${SERVER_IP} "sudo cat /var/lib/rancher/k3s/server/node-token")

curl -sfL https://get.k3s.io | K3S_URL="https://${SERVER_IP}:6443" K3S_TOKEN="${NODE_TOKEN}" sh -
