# Help

This file contains somme comment information about the project.


## Vagrant commands

Manage virtual machines with Vagrant using the following commands:

```bash
vagrant init <base_box> # create a Vagrantfile with the specified base box
vagrant up # start the virtual machine
vagrant ssh # connect to the virtual machine
# Terminate the SSH session with CTRL+D, or by logging out
vagrant suspend # save state and stop the virtual machine
vagrant halt # stop the virtual machine
vagrant reload --provision # restart VM and run all provision script
vagrant destroy # delete the virtual machine
```
Manage Vagrant boxes with the following commands:

```bash
vagrant box list # list all installed boxes
vagrant box add <name> <url> # add a box from a specific url
vagrant box remove <name> # remove a box
```

## Kubectl commands

Lot of this actions can be done with the kubernetes dashboard.

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

# Create a configuration file
kubectl create -f <file_name>
# Apply (Update/Create if not exits) a configuration file
kubectl apply -f <file_name>
# Delete a configuration file
kubectl delete -f <file_name>
```

## Helm commands

```bash
helm list # list all helm releases
helm install <release_name> <chart_name> # install a helm chart
helm uninstall <release_name> # uninstall a helm chart
helm upgrade <release_name> <chart_name> # upgrade a helm chart
helm rollback <release_name> <revision_number> # rollback a helm chart
```