#!/bin/bash

sudo kubectl port-forward svc/argocd-server -n argocd 8080:443  &>/dev/null &
sleep 5

ARGO_PWD=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)

sudo argocd login localhost:8080 --username admin --password $ARGO_PWD --insecure

sudo argocd app create my-app \
  --repo https://github.com/Gotr-byte/pbiederm_inception_of_things_p3 \
  --path . \
  --dest-namespace dev \
  --dest-server https://kubernetes.default.svc

sudo argocd app get my-app
sudo argocd app sync my-app
sudo argocd app set my-app --sync-policy automated

kubectl wait pods -n dev --all --for condition=Ready --timeout=600s
sleep 5
sudo kubectl port-forward service/playground-service -n dev 8888:8888

