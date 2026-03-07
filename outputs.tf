output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "alb_subnet_public" {
  value = module.vpc.public_subnets
}

# EKS Outputs
output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_name" {
  value = module.eks.cluster_name
}

output "oidc_provider_url" {
  value = module.eks.oidc_provider_url
}

output "oidc_provider_arn" {
  value = module.eks.oidc_provider_arn
}

output "cluster_certificate_authority_data" {
  value = module.eks.cluster_certificate_authority_data
}


########### Security Group Outputs ###########
output "eks_cluster_sg_id" {
  value = module.eks.eks_cluster_sg_id
}

# output "bastion_sg_id" {
#   value = module.eks.bastion_sg_id
# }



######### IAM Outputs ###########
output "eks_cluster_role_arn" {
  value = module.eks.eks_cluster_role_arn
}

output "eks_nodegroup_role_arn" {
  value = module.eks.eks_nodegroup_role_arn
}

# output "bastion_iam_instance_profile_name" {
#   value = aws_iam_instance_profile.bastion_profile.name
# }

# output "bastion_role_arn" {
#   value = aws_iam_role.bastion_role.arn
# }

output "alb_controller_role_arn" {
  value = module.eks.alb_controller_role_arn
}


## Helm Outputs
output "argocd_url" {
  value = module.helm.argocd_url
}

output "prometheus_url" {
  value = module.helm.prometheus_url
}

output "grafana_url" {
  value = module.helm.grafana_url
}