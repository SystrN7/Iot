#!/bin/sh

# Install k3d dependencies
sudo apt-get update
sudo apt-get upgrade -y

# Install docker
curl -sfL https://get.docker.com | sh
groupadd docker
sudo usermod -aG docker $USER

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
# Install binary
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl

# Install k3d
wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | TAG=v5.5.1 bash
# Create cluster
sudo k3d cluster create argocd --api-port 6443 -p 8080:80@loadbalancer --agents 2

mkdir -p ~/.kube
sudo k3d kubeconfig get argocd > ~/.kube/config

# Argocd CLI
curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64

