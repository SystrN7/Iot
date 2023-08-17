# Part 3 : K3d and Argo CD

During this part, we will use k3d to create a kubernetes cluster and deploy an
application with Argo CD and Github.

Application Argo CD:
 - application: `Argocd`
 - hostname: `argocd.cluster`
 - ip: `none`

Application:
 - application: `42 provide container`
 - hostname: `app.com`
 - ip: `none`

## Exposed applications
 - [Argo CD](http://argocd.cluster/)
 - [Application](http://app.com/)

## Technologies

### K3d

K3d is a lightweight wrapper to run k3s (Rancher Lab's minimal Kubernetes
distribution) in docker. This protects your local host from any modifications
and leaves your local kubernetes installation untouched.

### Argo CD

Argo CD is a group of tools to deploy applications on kubernetes clusters.
It monitors a Git repository for changes. This repository contains the
definition of the application to deploy. When a change is detected, Argo CD will
re-deploy the application on the cluster.

Argo CD can deploy applications that use Helm, Kustomize or Jsonnet.

In this case we will use Helm.

## Prerequisites

Instead of the previous part where we deployed our environment in a VM using
Vagrant, in this part we directly install Docker and K3d on the host machine.

To install all required tools, you can run the following command:

```bash
bash ./scripts/install.sh
```

To uninstall everything afterwards, you can run this:

```bash
bash ./scripts/uninstall.sh
```

### Install Docker

Refer to the [Official documentation](https://docs.docker.com/get-docker/) to
install Docker on your machine.

### Install K3d

Refer to the [Official documentation](https://k3d.io/#installation) to install
K3d on your machine.

## Run the cluster

To create and run the cluster, you can run the following command:

```bash
bash ./scripts/deploy.sh
```

To delete the cluster afterwards, you can run this:

```bash
bash ./scripts/reset.sh
```

## Test the cluster

Login to the Argo CD dashboard with the username and password displayed during
the execution of the script `deploy.sh`.

You should see that the application `42 provide container` is deployed.

By committing a change on the Github repository you should see the application
being updated.

## Sources
