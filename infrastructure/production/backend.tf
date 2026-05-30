terraform {
  backend "s3" {
    bucket = "federated-engineers-production-forge-lonestar-tf-state"
    key    = "lonestar/production/terraform.tfstate"
    region = "eu-central-1"
  }
}
