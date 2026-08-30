provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  count = 3

  bucket = "hanu-terraform-count-demo-${count.index}"
}
