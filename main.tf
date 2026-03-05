
module "vpc" {
  source = "github.com/thedevopsprashant/terraform-aws-modules//modules/vpc?ref=v1.0.0"
  vpc_cidr_block = "10.0.0.0/16"
  
}