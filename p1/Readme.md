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

## What is Vagrant?

Vagrant is a tool for building and managing virtual machine environments  with configuration files called Vagrantfiles. If you are familiar with Docker, you can think of Vagrant as a tool to create virtual machines instead of containers.

Like docker, Vagrant uses base image as a starting point to create a virtual machine. Vagrant calls this base image a box. A box can be a minimal operating system or a fully configured development environment. You can find boxes for Vagrant at [Vagrant Cloud](https://app.vagrantup.com/boxes/search).


## Install Vagrant

Refer to the [Official documentation](https://developer.hashicorp.com/vagrant/tutorials/getting-started/getting-started-install) to install Vagrant on your machine.

### Special notes for wsl2

I personally use wsl2 on windows 10, and I had to do some extra steps to make it work.

⚠️ Is not recommended *Todo* remove this part.

```bash
export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
export PATH="$PATH:/mnt/c/Program Files/Oracle/VirtualBox"
```

[Source](https://developer.hashicorp.com/vagrant/docs/other/wsl)

## Vagrant base commands

Manage virtual machines with Vagrant using the following commands:

```bash
vagrant init <base_box> # create a Vagrantfile with the specified base box
vagrant up # start the virtual machine
vagrant ssh # connect to the virtual machine
# Terminate the SSH session with CTRL+D, or by logging out
vagrant suspend # save state and stop the virtual machine
vagrant halt # stop the virtual machine
vagrant destroy # delete the virtual machine
```
Manage Vagrant boxes with the following commands:

```bash
vagrant box list # list all installed boxes
vagrant box add <name> <url> # add a box from a specific url
vagrant box remove <name> # remove a box
```

## Create the Vagrantfile

## Install k3s

```bash
apk update
apk add --no-cache k3s
```

## Install kubectl

```bash
apk add --no-cache kubectl
```

## Assign a role to the nodes

```bash
# On the server
k3s server --node-external-ip
# On the server worker
k3s agent --server https://
```

## Test the cluster

