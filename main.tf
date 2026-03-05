
module "vpc" {
  source = "github.com/thedevopsprashant/terraform-aws-modules//modules/vpc?ref=v1.0.0"
 
  vpc_cidr_block = var.vpc_cidr_block
  public_subnet = var.public_subnet
  private_subnet = var.private_subnet
  env = var.env
  cluster_name = var.cluster_name

}