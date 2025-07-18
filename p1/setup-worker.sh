#!/bin/bash

# Install dependencies
sudo apt-get update
sudo apt-get install -y curl

# Read token from shared folder
TOKEN=$(cat /vagrant/node-token)

# Install K3s in agent mode
curl -sfL https://get.k3s.io | K3S_URL="https://192.168.56.110:6443" K3S_TOKEN="$TOKEN" sh -
