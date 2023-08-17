# Create kube namesapce
kubectl create namespace argocd
kubectl create namespace dev

# Install ArgoCD
kubectl apply -n argocd -f confs/argocd-cmd-params-cm.yaml
kubectl apply -n argocd -f confs/argocd.yaml
kubectl apply -n argocd -f confs/argocd-ingress.yaml

# Install 

argocd login --core
# https://stackoverflow.com/questions/69483408/argocd-getting-started-guide-getting-fata0000-configmap-argocd-cm-not-found
kubectl config set-context --current --namespace=argocd

while [ $(kubectl get pods -l app.kubernetes.io/name=argocd-server -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]
do
    echo "Waiting argocd start ..."
    sleep 10
done

echo "Wait for argocd to start extra delay (180s)"
sleep 180 # wait for argocd to start

argocd app create fgalaup-iot \
    --server localhost \
    --dest-namespace dev \
    --dest-server https://kubernetes.default.svc \
    --repo https://github.com/SystrN7/fgalaup_iot.git \
    --path Apps

argocd app set fgalaup-iot --sync-policy automated

# Get argocd Password
echo "Argocd login : admin"
echo -n "Argocd login password: "
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
echo

# Make port forwarding to access to argocd
#kubectl port-forward svc/argocd-server -n argocd 8081:443
