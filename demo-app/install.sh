helm repo add bitnami https://charts.bitnami.com/bitnami
kubectl create namespace demo-app
helm install demo-db bitnami/postgresql --namespace=demo-app
