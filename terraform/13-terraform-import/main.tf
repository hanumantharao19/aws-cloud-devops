provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "hanu-existing-bucket-2026"

  tags = {
    Name        = "Existing Bucket"
    Environment = "dev"
  }
}
