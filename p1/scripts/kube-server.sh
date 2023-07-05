#!/bin/bash


IP_ADDRESS=$(ip a show enp0s8 | grep "inet " | awk '{print $2}' | cut -d / -f1)
NODE_TOKEN="/var/lib/rancher/k3s/server/node-token"
KUBE_CONFIG="/etc/rancher/k3s/k3s.yaml"

curl -sfL https://get.k3s.io | sh -

while [ ! -e ${NODE_TOKEN} ]
do
    sleep 2
done

cat ${NODE_TOKEN}

mkdir -p /vagrant/tmp
cp ${NODE_TOKEN} /vagrant/tmp
cp ${KUBE_CONFIG} /vagrant/tmp #copy contents of "k3s.yaml" to ".kube/config" to 'kubectl' from local-machine
echo ${IP_ADDRESS} > /vagrant/tmp/server-address


# Copy kube config to user home (To use kuectl)
mkdir -p /home/vagrant/.kube
cp /etc/rancher/k3s/k3s.yaml /home/vagrant/.kube/config
chmod +r /home/vagrant/.kube/config
