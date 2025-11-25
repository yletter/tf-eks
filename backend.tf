terraform {
  backend "s3" {
    bucket = "tf-eks-yuvaraj"
    region = "us-east-1"
    key = "vpc/terraform.tfstate"
  }
}