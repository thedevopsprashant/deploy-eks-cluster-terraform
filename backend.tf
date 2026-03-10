terraform {
  backend "s3" {
    bucket = "prashant-tfstates-bucket"
    region = var.region
    key = "deploy_ekscluster/terraform.tfstate"
    use_lockfile = true
    encrypt = true
  }
}