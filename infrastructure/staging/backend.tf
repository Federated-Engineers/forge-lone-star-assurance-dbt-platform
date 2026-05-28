terraform {
  backend "s3" {
    bucket         = "federated-engineers-production-forge-lonestar-tf-state"
    key            = "lonestar/staging/terraform.tfstate"
    region         = "eu-central-1"
  }
}