terraform {
  backend "s3" {
    bucket = "hanu-terraform-state-2026-demo"
    key    = "product-ec2/terraform.tfstate"
    region = "us-east-1"
  }
}