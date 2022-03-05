# Demo for managing K8s Application with Terraform

This Terraform project is a demo for managing K8s applications with Terraform. It will install the Kasten helm chart and related AWS resources.

First, create the Kubernetes cluster using the code in the `cluster` directory.

```sh
# first init terraform:
terraform init

# then run apply to create helm release and AWS resources:
terraform apply

# and remove everything again using:
terraform destroy
```

To add the Kasten export profile you will additionally have to:

- Update the bucket in the `kasten-export-profile.yaml`
- Run `kubectl apply -f kasten-export-profile.yaml`

## Open Kasten Web UI

```sh
kubectl --namespace kasten-io port-forward service/gateway 8080:8000
```

Go to http://127.0.0.1:8080/k10/#/dashboard

## Switch to Vault

```sh
kubectl create secret generic vault-creds \
    --namespace kasten-io \
    --from-literal vault_token=<token>

kubectl create -f passkey-vault.yaml
```
