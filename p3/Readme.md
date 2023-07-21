# Part 3 : K3d and Argo CD

During this part, we will use k3d to create a kubernetes cluster and deploy an application with Argo CD and Github.

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

K3d is a lightweight wrapper to run k3s (Rancher Lab’s minimal Kubernetes distribution) in docker.
This protects your local host from any modifications and leaves your local kubernetes installation untouched.

### Argo CD

Argo CD is tools to deploy application on kubernetes cluster.
Is monitoring a Git repository for changes. This repository contains the definition of the application to deploy.
When a change is detected, Argo CD will deploy the application on the cluster.

Argo CD can deploy application use Helm, Kustomize or Jsonnet.

In this case we will use Helm.

## Prerequisites

Instead of the previous part deploy an environment in vagrant VM.
int this part we directly install docker and k3d on the host machine.

to install all required tools, you can run the following command:

```bash
# Run this to install all required tools.
bash ./scripts/install.sh

# Run this to uninstall all tools.
bash ./scripts/uninstall.sh
```

is this commmand fail, you can install all required tools manually.

### Install Docker

Refer to the [Official documentation](https://docs.docker.com/get-docker/) to install Docker on your machine.

### Install K3d

Refer to the [Official documentation](https://k3d.io/#installation) to install K3d on your machine.


## Run the cluster

To run the cluster, you can run the following command:

```bash
# Run this to create the cluster.
bash ./scripts/deploy.sh

# Run this to delete the cluster.
bash ./scripts/reset.sh
```

## Test the cluster

login to the argocd dashboard with username and password given durring execution of the script `deploy.sh`.

you can see the application `42 provide container` is deployed.

commit a change on the github repository and see the application is updated.


## Sources