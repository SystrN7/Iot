# Part 2 : K3s and three simple applications

In this seconde part we only use one node (fgalaupS) and we will deploy three simple applications on them with kubernetes and helm.

## Exposed applications
Warning: The exposed applications are not secured and should not be used in production environment !
 - [Trafiik Dashboard](http://traefik.cluster/dashboard/)
 - [Kubernetes Dashboard](https://kubernetes.cluster/)
To get the token to connect to the kubernetes dashboard, run the following command:
```bash
# Run this command on the server fgalaupS shell. (vagrant ssh fgalaupS)
sudo k3s kubectl -n kubernetes-dashboard create token admin-user
```
 - [Application 1](http://app1.com/)
 - [Application 2](http://app2.com/)
 - [Application 3](http://app3.com/)

## Kubernetes

## Helm


## Sources
 - [Expose Trafiik Dashboard](https://k3s.rocks/traefik-dashboard/)
 - [Expose Bubernetes Dashboard](https://pgillich.medium.com/setup-lightweight-kubernetes-with-k3s-6a1c57d62217)
 