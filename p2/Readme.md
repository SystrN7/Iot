# Part 2 : K3s and three simple applications

In this seconde part we only use one node (fgalaupS) and we will deploy three simple applications on them with kubernetes and helm.

## Kubernetes

## Helm



## Kubectl commands



```bash
kubectl get nodes # list all nodes in the kubernetes cluster
kubectl get pods # list all pods
kubectl get services # list all services
kubectl get deployments # list all deployments
kubectl get ingress # list all ingress (entry point to the cluster)
kubectl get configmaps # list all config 

# Describe a kubernetes resource
kubectl describe node <node_name> 
kubectl describe pod <pod_name>
...

# Delete a kubernetes resource
kubectl delete node <node_name>
kubectl delete pod <pod_name>
...

# Get the logs of a pod
kubectl logs <pod_name>

# Apply a configuration file
kubectl apply -f <file_name>
# Delete a configuration file
kubectl delete -f <file_name>
```

## Sources
 - [Expose Trafiik Dashboard](https://k3s.rocks/traefik-dashboard/)
 - [Expose Bubernetes Dashboard](https://pgillich.medium.com/setup-lightweight-kubernetes-with-k3s-6a1c57d62217)
 