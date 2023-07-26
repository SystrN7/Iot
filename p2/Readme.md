# Part 2 : K3s and three simple applications

In this second part we only use one node (fgalaupS) and we will deploy three
simple applications on it with kubernetes and helm (optional).

Each application must be accessible with a hostname as follows:

Application one:
 - application: `hello-kubernetes`
 - hostname: `app1.com`
 - ip: `none`

Application two:
 - application: `hello-kubernetes`
 - hostname: `app2.com`
 - ip: `none`

Application three:
 - application: `hello-kubernetes`
 - hostname: `*`
 - ip: `none`


## Exposed applications
Warning: The exposed applications are not secured and should not be used in production environment !
 - [Trafiik Dashboard](http://traefik.cluster/dashboard/)
 - [Kubernetes Dashboard](https://kubernetes.cluster/)
To get the token to connect to the kubernetes dashboard, run the following command:
```bash
# Run this command on the server's shell. (vagrant ssh fgalaupS)
sudo k3s kubectl -n kubernetes-dashboard create token admin-user
```
 - [Application 1](http://app1.com/)
 - [Application 2](http://app2.com/)
 - [Application 3](http://app3.com/)

## Technologies

### Kubernetes
Kubernetes is an open-source container-orchestration system for automating
computer application deployment, scaling, and management.
The goal is to synchronize the cluster state with the one defined in the
configuration files.

### Helm
Helm is a package manager for Kubernetes that allows developers and operators
to more easily package, configure, and deploy applications and services onto
Kubernetes clusters. It is basically a template engine to replace values in a
template file with values from a values file or from command line parameters.

### What is an ingress controller?

The role of an ingress controller is creating an entry point for incoming
traffic into the cluster. Ingress controllers are usually deployed as load
balancers that route traffic to backend services inside the cluster. The ingress
controller can be configured to expose services based on hostname or path.

By default, k3s comes with Traefik as its ingress controller.


## Prerequisites
Same as part 1.

## Run the cluster

Your current working directory must be the root of the project. (the directory
that contains the Vagrantfile)

```bash
# Create and start the virtual machines and run the init shell script.
bash ./run.sh
```

## Test the cluster

```bash
# To establish an SSH connection to the server fgalaupS.
vagrant ssh fgalaupS
```

```bash
# Run this command on the server fgalaupS shell.
kubectl get nodes -o wide
kubectl get all -n kube-system
```

Expected output:
```

```

## Sources
 - [Expose Traefik Dashboard](https://k3s.rocks/traefik-dashboard/)
 - [Expose Kubernetes Dashboard](https://pgillich.medium.com/setup-lightweight-kubernetes-with-k3s-6a1c57d62217)
 - [Helm Docs](https://helm.sh/docs/intro/quickstart/)
 - [Traefik ingress](https://doc.traefik.io/traefik/getting-started/quick-start-with-kubernetes/)
 - [Hello-kubernetes App repository](https://github.com/paulbouwer/hello-kubernetes)
