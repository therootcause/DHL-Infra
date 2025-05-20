# backend.tf
terraform {
  backend "s3" {
    bucket         = "dragonhunterlabs-terraform-state"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
