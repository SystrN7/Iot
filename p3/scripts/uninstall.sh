#!/bin/bash

# Remove k3d
k3d cluster delete -a
sudo rm -v $(which k3d)

# Remove docker
sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
# Remove all images, containers, volumes, and networks (doesn't remove durring purge)
sudo rm -rvf /var/lib/docker
sudo rm -rvf /var/lib/containerd

# Remove kubectl and argocd CLI
sudo rm -v /usr/local/bin/kubectl
sudo rm -v /usr/local/bin/argocd
