output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "nat_public_ips" {
  description = "NAT public ip"
  value       = module.vpc.nat_public_ips
}