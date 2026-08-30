provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "app" {
  bucket = "hanu-lifecycle-demo-2026"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "application-bucket"
  }
}
