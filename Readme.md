# Inception of Things (IoT)

The aim of this project is to introduce you to kubernetes from a developer's point of view. You will have to set up small clusters and discover the mechanics of continuous integration. By the end of this project, you'll be able to get a cluster up and running quickly in Docker and thus have usable continuous integration for your applications.

This project is divided into 3 parts + 1 bonus part:
 - Part 1: Install the environments tools vagrant, kubernetes and create cluster with one server and one agent.
 - Part 2: Deploy three web application only on the server with ingress controller (Traefik).
 - Part 3: Create a cluster with k3d and deploy an application with Argo CD and Github.
 - Bonus: Use previously created k3d cluster and deploy an application with Argo CD and self-hosted Gitlab.

## Part 1: K3s and Vagrant
[Readme](p1/Readme.md)
## Part 2: K3s and three simple applications
[Readme](p2/Readme.md)
## Part 3: K3d and Argo CD
[Readme](p3/Readme.md)

## Technologies
 - [VirtualBox](https://www.virtualbox.org/) - ([Documentation](https://www.virtualbox.org/wiki/Documentation))
 - [Vagrant](https://www.vagrantup.com/) - ([Documentation](https://www.vagrantup.com/docs))
 - [Docker](https://www.docker.com/) - ([Documentation](https://docs.docker.com/))
 - [Podman](https://podman.io/) - ([Documentation](https://docs.podman.io/))
 - [K3s](https://k3s.io/) - ([Documentation](https://rancher.com/docs/k3s/latest/en/))
 - [K3d](https://k3d.io/)
 - [Kubernetes](https://kubernetes.io/) - ([Documentation](https://kubernetes.io/docs/home/))
 - [Helm](https://helm.sh/) - ([Documentation](https://helm.sh/docs/))
 - [Traefik](https://doc.traefik.io/traefik/) - ([Documentation](https://doc.traefik.io/traefik/))
 - [Argo CD](https://argo-cd.readthedocs.io/en/stable/)
 - [Gitlab](https://about.gitlab.com/) - ([Documentation](https://docs.gitlab.com/))


## Authors
 - Morgan Houppin ([mhouppin](https://github.com/mhouppin))
 - Felix Galaup ([fgalaup](https://github.com/SystrN7))