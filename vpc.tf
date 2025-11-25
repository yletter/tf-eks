# Create VPC Terraform Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.4.0"

  # VPC Basic Details
  name = "vpc-${local.owner}-${local.environment}"
  cidr = var.cidr_block
  azs  = var.azs

  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  # Database Subnets
  create_database_subnet_group       = true
  create_database_subnet_route_table = true
  database_subnets                   = var.database_subnets

  #create_database_nat_gateway_route = true
  #create_database_internet_gateway_route = true

  # NAT Gateways - Outbound Communication
  enable_nat_gateway = true
  single_nat_gateway = true

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnet_tags = {
    Type = "public-subnets"
  }

  private_subnet_tags = {
    Type = "private-subnets"
  }

  database_subnet_tags = {
    Type = "database-subnets"
  }

  tags = local.common_tags

  vpc_tags = local.vpc_tags
  # Instances launched into the Public subnet should be assigned a public IP address.
  map_public_ip_on_launch = true
}