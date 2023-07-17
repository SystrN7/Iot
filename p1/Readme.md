# Part 1 : Setup Environment (Vagrant, k3s)

In this first part, we will setup the environment and create two virtual machines with Vagrant, and install k3s on them.

Server:
 - hostname: `fagalaupS`
 - ip: `192.168.56.110`
 - hardware: 1 CPU, 1GB RAM, 5GB disk
 - services/software: ssh, k3s, kubectl
 - mode: controller (master)

ServerWorker:
 - hostname: `fagalaupSW`
 - ip: `192.168.56.111`
 - hardware: 1 CPU, 1GB RAM, 5GB disk
 - services/software: ssh, k3s, kubectl
 - mode: agent (slave)

## Technologies

### Vagrant

Vagrant is a tool for building and managing virtual machine environments  with configuration files called Vagrantfiles. If you are familiar with Docker, you can think of Vagrant as a tool to create virtual machines instead of containers.

Like docker, Vagrant uses base image as a starting point to create a virtual machine. Vagrant calls this base image a box. A box can be a minimal operating system or a fully configured development environment. You can find boxes for Vagrant at [Vagrant Cloud](https://app.vagrantup.com/boxes/search).

### K3s

K3s is a lightweight Kubernetes distribution created by Rancher Labs. It is designed for edge computing, IoT, and CI/CD. It is packaged as a single binary and only requires 512MB of RAM to run.

## Prerequisites

### Install VirtualBox

you need to install VirtualBox on your machine as Virtual machine provider for vagrant.

Refer to the [Official documentation](https://www.virtualbox.org/wiki/Downloads) to install VirtualBox on your machine.

### Install Vagrant

Refer to the [Official documentation](https://developer.hashicorp.com/vagrant/tutorials/getting-started/getting-started-install) to install Vagrant on your machine.


## Run the cluster

You current working directory must be the root of the project. (the directory that contains the Vagrantfile)

```bash
# Create and start the virtual machines and run the init shell script.
vagrant up
```

## Test the cluster

```bash
# To establish an SSH connection to the server fgalaupS.
vagrant ssh fgalaupS
# To establish an SSH connection to the server fgalaupSW.
vagrant ssh fgalaupSW
```

```bash
# Run this command on the server fgalaupS shell. (vagrant ssh fgalaupS)
sudo k3s kubectl get nodes
```

Expected output:
```
NAME         STATUS   ROLES                  AGE   VERSION
fgalaupS     Ready    control-plane,master   10m   v1.21.2+k3s1
fgalaupSW    Ready    <none>                 10m   v1.21.2+k3s1
```

## Sources
 - [Vagrant Getting started](https://developer.hashicorp.com/vagrant/tutorials/getting-started)
 - [K3s install](https://docs.k3s.io/installation/configuration#configuration-with-install-script)
 - [K3s config option](https://docs.k3s.io/cli)
 - [Tutorial](https://tferdinand.net/creer-un-cluster-kubernetes-local-avec-vagrant/)(French)