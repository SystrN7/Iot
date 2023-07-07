#!/bin/bash

# |========== Install common dependency ==========|
apt-get update
apt-get upgrade -y
apt-get install -y curl
apt-get install -y podman # Is a docker alternative

# |========== Install K3S ==========|
curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644


# |========== Install Kubectl ==========|
#  - Source (https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
# Download binary
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
# Install binary
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl

# |========== Install Helm ==========|
#  - Source (https://helm.sh/docs/intro/install/)
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | tee /usr/share/keyrings/helm.gpg > /dev/null
apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list
apt-get update
apt-get install helm


# |========== Setup kube config ==========|

KUBE_CONFIG="/etc/rancher/k3s/k3s.yaml"

while [ ! -e ${KUBE_CONFIG} ]
do
    sleep 2
done

# Configure kuectl
mkdir -p /home/vagrant/.kube
cp /etc/rancher/k3s/k3s.yaml /home/vagrant/.kube/config
