# AWS EC2 Instance Terraform Module
# Bastion Host - EC2 Instance that will be created in VPC Public Subnet
module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.1.5"
  name    = "BastionHost"
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = "t2.micro"
  key_name               = var.instance_keypair
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.bastion_host_sg.security_group_id]
  
  tags = local.common_tags
}

variable "instance_keypair" {
  description = "EC2 Key Pair name"
  type        = string
  default     = "KeyPair2025"
}