# Create kube namesapce
kubectl create namespace argocd
kubectl create namespace dev

# Install ArgoCD
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl apply -n argocd -f confs/argocd-cmd-params-cm.yaml
kubectl apply -n argocd -f confs/argocd-ingress.yaml

# Install 

argocd login --core
# https://stackoverflow.com/questions/69483408/argocd-getting-started-guide-getting-fata0000-configmap-argocd-cm-not-found
kubectl config set-context --current --namespace=argocd

argocd app create fgalaup-iot \
 --server localhost \
 --dest-namespace dev \
 --dest-server https://kubernetes.default.svc \
 --repo https://github.com/argoproj/argocd-example-apps.git \
 --path /

 argocd app sync fgalaup-iot

# Get argocd Password
echo "Argocd login : admin"
echo -n "Argocd login password: "
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
echo

# Make port forwarding to access to argocd
#kubectl port-forward svc/argocd-server -n argocd 8081:443