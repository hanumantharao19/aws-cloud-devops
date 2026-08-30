provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "production_data" {
  bucket = "hanu-production-data-2026"

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name        = "production-data"
    Environment = "prod"
  }
}
