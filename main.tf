
module "vpc" {
  source = "github.com/thedevopsprashant/terraform-aws-modules//modules/vpc?ref=v1.0.0"
 
  vpc_cidr_block = var.vpc_cidr_block
  public_subnet = var.public_subnet
  private_subnet = var.private_subnet
  env = var.env
  cluster_name = var.cluster_name

}

module "eks" {
  source = "github.com/thedevopsprashant/terraform-aws-modules//modules/eks?ref=v1.0.5"

  env          = var.env
  cluster_name = var.cluster_name
  region       = var.region

  # Input vars from other modules
  vpc_id = module.vpc.vpc_id
  subnet_ids           = module.vpc.private_subnets

  is_eks_cluster_enabled     = var.is_eks_cluster_enabled
  cluster_version            = var.cluster_version
  endpoint_private_access    = var.endpoint_private_access
  endpoint_public_access     = var.endpoint_public_access
  authentication_mode        = var.authentication_mode
  ondemand_instance_types    = var.ondemand_instance_types
  spot_instance_types        = var.spot_instance_types
  desired_capacity_on_demand = var.desired_capacity_on_demand
  min_capacity_on_demand     = var.min_capacity_on_demand
  max_capacity_on_demand     = var.max_capacity_on_demand
  desired_capacity_spot      = var.desired_capacity_spot
  min_capacity_spot          = var.min_capacity_spot
  max_capacity_spot          = var.max_capacity_spot
  addons                     = var.addons

  is_eks_role_enabled           = true
  is_eks_nodegroup_role_enabled = true
  is_alb_controller_enabled     = true

  oidc_provider_url             = module.eks.oidc_provider_url
  oidc_provider_arn             = module.eks.oidc_provider_arn

  depends_on = [module.vpc]
}

module "helm" {
  source = "github.com/thedevopsprashant/terraform-aws-modules//modules/helm?ref=v1.0.5"

  cluster_name            = module.eks.cluster_name
  vpc_id                  = module.vpc.vpc_id
  region                  = var.region
  alb_controller_role_arn = module.eks.alb_controller_role_arn

  alb_controller_version = "1.17.0"
  argocd_version = "9.3.1"
  prometheus_stack_version = "81.0.0"

  depends_on = [module.eks, module.vpc]
}