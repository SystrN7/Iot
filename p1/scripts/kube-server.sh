# k3s server --node-name fgalaupS --token $K3S_CLUSTER_TOKEN

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server" sh -s - --flannel-backend none --token $K3S_CLUSTER_TOKEN