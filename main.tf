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

# Provider Block
provider "aws" {
  region  = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "tf-eks-yuvaraj"
    region = "us-east-1"
    key = "tf-eks/terraform-eks.tfstate"

    dynamodb_table = "eks-lock-table"
  }
}