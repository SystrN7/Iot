#!/bin/bash

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="agent --server https://192.168.56.110:6443 --token $K3S_CLUSTER_TOKEN" sh -s -

# Copy kube config to user home (for kuectl)
sudo chmod +r /etc/rancher/k3s/k3s.yaml
mkdir -p ~/.kube
cp /etc/rancher/k3s/k3s.yaml ~/.kube/config