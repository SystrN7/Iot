#!/bin/bash

echo " ===========K3S_CLUSTER_TOKEN====================== =" $K3S_CLUSTER_TOKEN;


curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server" sh -s - --token $K3S_CLUSTER_TOKEN

# Copy kube config to user home (for kuectl)
sudo chmod +r /etc/rancher/k3s/k3s.yaml
mkdir -p ~/.kube
cp /etc/rancher/k3s/k3s.yaml ~/.kube/config