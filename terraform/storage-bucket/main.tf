terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
    random = {
        source = "hashicorp/random"
        version ="3.6.3"
    }

  }
}

resource "random_id" "name" {
    byte_length = 8
  
}
resource "aws_s3_bucket" "bucket" {
  bucket = "mhr-dev-bkt-${random_id.name.hex}"

  tags = {
    Dommain       = "Finance"
    Environment = "Dev"
  }
}
