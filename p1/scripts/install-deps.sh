#!/bin/bash

# |========== Install common dependency ==========|
apt-get update
apt-get upgrade -y
apt-get install -y curl
apt-get install -y ca-certificates

# |========== Install Kubectl ==========|
#  - Source (https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
# Download binary
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
# Install binary
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl

# |========== Install Docker ==========|
# I don't use docker beacause podman exist LOL
apt-get install -y podman 