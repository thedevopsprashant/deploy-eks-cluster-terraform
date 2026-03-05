# terraform {
#   backend "s3" {
#     bucket = "bucket-name"
#     region = "bucket-region"
#     key = "terraform.tfstate"
#     use_lockfile = true
#     encrypt = true
#   }
# }