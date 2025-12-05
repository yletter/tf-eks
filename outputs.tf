output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "nat_public_ips" {
  description = "NAT public ip"
  value       = module.vpc.nat_public_ips
}

output "cluster_certificate_authority_data" {
  description = "Nested attribute containing certificate-authority-data for your cluster. This is the base64 encoded certificate data required to communicate with your cluster."
  value       = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

output "cluster_endpoint" {
  description = "The endpoint for your EKS Kubernetes API."
  value       = aws_eks_cluster.eks_cluster.endpoint
}

output "cluster_id" {
  description = "The name of the EKS Cluster."
  value       = aws_eks_cluster.eks_cluster.name
}
