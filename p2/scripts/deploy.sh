#Deploy apps
echo "Deploying apps..."

# Deploy tools
# Deploy kubernetes dashboard
GITHUB_URL=https://github.com/kubernetes/dashboard/releases
VERSION_KUBE_DASHBOARD=$(curl -w '%{url_effective}' -I -L -s -S ${GITHUB_URL}/latest -o /dev/null | sed -e 's|.*/||')
kubectl create -f https://raw.githubusercontent.com/kubernetes/dashboard/${VERSION_KUBE_DASHBOARD}/aio/deploy/alternative.yaml

kubectl create -f /vagrant/confs/dashboard/kubernetes/admin-user-role.yml
kubectl create -f /vagrant/confs/dashboard/kubernetes/admin-user.yml
kubectl create -f /vagrant/confs/dashboard/kubernetes/ingress.yml

# Deploy Trafiik dashboard
kubectl apply -f /vagrant/confs/dashboard/trafiik/service.yaml
kubectl apply -f /vagrant/confs/dashboard/trafiik/ingress.yaml

# Deploy apps1
# Deploy apps2
# Deploy apps3