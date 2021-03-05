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
