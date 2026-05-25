terraform {
  backend "s3" {
    bucket         = "federated-engineers-staging-forge-lonestar-tf-state"
    key            = "lonestar/staging/terraform.tfstate"
    region         = "eu-central-1"
  }
}