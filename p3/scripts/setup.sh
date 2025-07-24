#!/bin/bash

sudo usermod -aG docker $USER

sudo k3d cluster create p3cluster

sudo kubectl cluster-info

sudo kubectl create namespace argocd
sudo kubectl create namespace dev

sudo kubectl get namespace

sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

