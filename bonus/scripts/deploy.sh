#!/bin/bash

# Add Gitlab to hosts file
if [ -f /etc/hosts.bak ]
then
    sudo bash -c 'cat confs/hosts >> /etc/hosts'
fi

# Create kube namesapce
kubectl create namespace gitlab

# Install Gitlab
helm repo add gitlab https://charts.gitlab.io/
helm repo update
helm upgrade --install gitlab gitlab/gitlab \
    --timeout 600s \
    --set global.edition=ce \
    --set global.hosts.domain=gitlab.cluster \
    --set global.hosts.externalIP=127.0.0.1 \
    --set certmanager.install=false \
    --set global.ingress.configureCertmanager=false \
    --set gitlab-runner.install=false
