provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "demo" {

  bucket = "hanu-terraform-state-demo-2026"

  tags = {
    Name        = "terraform-state-demo"
    Environment = "dev"
  }
}
