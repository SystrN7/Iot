# k3s agent  --node-name fgalaupSW --server https://192.168.56.110:6443 --token $K3S_CLUSTER_TOKEN

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="agent --server https://192.168.56.110:6443 --token $K3S_CLUSTER_TOKEN" sh -s -