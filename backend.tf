terraform {
  backend "s3" {
    bucket = "prashant-tfstates-bucket"
    region = "ap-south-1"
    key = "deploy_ekscluster/terraform.tfstate"
    use_lockfile = true
    encrypt = true
  }
}