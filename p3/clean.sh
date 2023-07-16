#!/bin/bash

# Remove k3d
k3d cluster delete -a
sudo rm $(which k3d)

# Remove kubectl and podman
sudo apt-get remove podman -y
sudo rm /usr/local/bin/kubectl
sudo rm /usr/local/bin/argocd