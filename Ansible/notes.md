# Syntax Notes

- Install Microk8s:
```bash
sudo snap install microk8s --channel=1.24/stable --classic
microk8s status --wait-ready
sudo microk8s enable dns storage helm3 helm ingress
```
- Install Helm
```bash
microk8s helm repo add rancher-stable https://releases.rancher.com/server-charts/stable

microk8s kubectl create namespace cattle-system

microk8s kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.7.1/cert-manager.crds.yaml

microk8s helm repo add jetstack https://charts.jetstack.io

microk8s helm repo update

microk8s helm install cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.7.1

microk8s kubectl get pods --namespace cert-manager
microk8s
microk8s
```