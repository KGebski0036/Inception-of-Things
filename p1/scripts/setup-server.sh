#!/bin/bash
curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" sh -
NODE_TOKEN="/var/lib/rancher/k3s/server/node-token"
while [ ! -f ${NODE_TOKEN} ]
do
     sleep 1
done
sudo cp ${NODE_TOKEN} /vagrant/
echo 'alias k="kubectl"' >> /home/vagrant/.bashrc
