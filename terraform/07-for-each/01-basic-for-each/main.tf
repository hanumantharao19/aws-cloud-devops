provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  for_each = toset([
    "dev",
    "qa",
    "prod"
  ])

  bucket = "hanu-terraform-${each.key}-2026"
}
