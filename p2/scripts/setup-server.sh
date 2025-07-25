#!/bin/bash
curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" sh -

until kubectl get nodes &>/dev/null; do
    sleep 2
done

cd /vagrant

kubectl apply -f app1.yaml --validate=false
kubectl apply -f app2.yaml --validate=false
kubectl apply -f app3.yaml --validate=false
kubectl apply -f ingress.yaml --validate=false
