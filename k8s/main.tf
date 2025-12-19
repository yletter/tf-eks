# Terraform Block
terraform {
  required_version = "~> 1.14.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.21.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = "~> 3.1.1"
    }

    http = {
      source = "hashicorp/http"
      version = "~> 3.5.0"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 3.0.0"
    }
  }
}
# Terraform HTTP Provider Block
provider "http" {
  # Configuration options
}

# Provider Block
provider "aws" {
  region  = "us-east-1"
}
provider "helm" {
  kubernetes = {
    host                   = data.terraform_remote_state.eks.outputs.cluster_endpoint
    cluster_ca_certificate = base64decode(data.terraform_remote_state.eks.outputs.cluster_certificate_authority_data)
    token                  = data.aws_eks_cluster_auth.cluster.token
  }
}
# Terraform Remote State Datasource - Remote Backend AWS S3
data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket = "tf-eks-yuvaraj"
    region = "us-east-1"
    key = "tf-eks/terraform-eks.tfstate"
  }
}

terraform {
  backend "s3" {
    bucket = "tf-eks-yuvaraj"
    region = "us-east-1"
    key = "tf-eks/terraform-k8s.tfstate"
    dynamodb_table = "k8s-lock-table"
  }
}

data "aws_eks_cluster_auth" "cluster" {
  name = data.terraform_remote_state.eks.outputs.cluster_id
}

# Terraform Kubernetes Provider
provider "kubernetes" {
  host                   = data.terraform_remote_state.eks.outputs.cluster_endpoint
  cluster_ca_certificate = base64decode(data.terraform_remote_state.eks.outputs.cluster_certificate_authority_data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}
