#!/bin/bash

# |========== Install common dependency ==========|
apt update
apt upgrade -y
apt install -y curl

# |========== Install Kubectl ==========|
#  - Source (https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
# Download binary
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
# Install binary
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# |========== Install Docker ==========|
# I don't use docker beacause podman exist LOL
apt install -y podman 