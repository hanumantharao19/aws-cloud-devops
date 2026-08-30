terraform {
  backend "s3" {
    bucket = "hanu-terraform-state-2026"
    key    = "class19/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "demo" {
  bucket = var.bucket_name

  tags = {
    Name        = "terraform-cicd-demo"
    Environment = "dev"
  }
}
