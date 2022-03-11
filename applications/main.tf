provider "aws" {
  region = "eu-central-1"
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

locals {
  tags = {
    Project   = "Terraform K8s Example Applications"
    Terraform = "True"
  }
}

data "aws_caller_identity" "current" {}
