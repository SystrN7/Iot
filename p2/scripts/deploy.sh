#Deploy apps
echo "Deploying apps..."

# Deploy tools
# Deploy kubernetes dashboard
GITHUB_URL=https://github.com/kubernetes/dashboard/releases
VERSION_KUBE_DASHBOARD=$(curl -w '%{url_effective}' -I -L -s -S ${GITHUB_URL}/latest -o /dev/null | sed -e 's|.*/||')
kubectl create -f https://raw.githubusercontent.com/kubernetes/dashboard/${VERSION_KUBE_DASHBOARD}/aio/deploy/alternative.yaml

kubectl create -f /vagrant/confs/dashboard/kubernetes/admin-user-role.yaml
kubectl create -f /vagrant/confs/dashboard/kubernetes/admin-user.yaml
kubectl create -f /vagrant/confs/dashboard/kubernetes/ingress.yaml

# Deploy Trafiik dashboard
kubectl apply -f /vagrant/confs/dashboard/trafiik/service.yaml
kubectl apply -f /vagrant/confs/dashboard/trafiik/ingress.yaml

# Deploy apps1
kubectl apply -f /vagrant/confs/test/hello-deployment.yaml
kubectl apply -f /vagrant/confs/test/hello-service.yaml
kubectl apply -f /vagrant/confs/test/hello-ingress.yaml

# Deploy apps2

# Deploy apps3