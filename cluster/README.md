# Terraform AWS EKS Cluster Demo

Demo for setting up a minimal EKS cluster with Terraform.

```sh
# first init terraform:
terraform init

# then run apply to create the cluster:
terraform apply

# Optionally, update kubeconfig
aws eks update-kubeconfig --name example

# and destroy the cluster again using:
terraform destroy
```
