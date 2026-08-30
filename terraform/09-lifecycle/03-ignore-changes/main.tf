provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "app" {
  bucket = "hanu-ignore-changes-demo-2026"

  tags = {
    Name        = "application-bucket"
    Environment = "dev"
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
