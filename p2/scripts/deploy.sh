#Deploy apps

sleep 10
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
helm install --create-namespace --namespace hello-kubernetes app1 /vagrant/confs/app \
  --set ingress.host="app1.com" \
  --set message="Hello from app1." \
  --set deployment.replicaCount=1

# Deploy apps2
helm install --create-namespace --namespace hello-kubernetes app2 /vagrant/confs/app \
  --set ingress.host="app2.com" \
  --set message="Hello from app2." \
  --set deployment.replicaCount=3

# Deploy apps3
helm install --create-namespace --namespace hello-kubernetes app3 /vagrant/confs/app \
  --set ingress.host="" \
  --set message="Hello from app3." \
  --set deployment.replicaCount=1