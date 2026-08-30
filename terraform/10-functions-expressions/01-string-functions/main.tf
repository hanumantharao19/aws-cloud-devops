provider "aws" {
  region = "us-east-1"
}

variable "application" {
  default = "Product-Service"
}

variable "environment" {
  default = "DEV"
}

resource "aws_s3_bucket" "app" {
  bucket = "${lower(var.application)}-${lower(var.environment)}-data-2026"

  tags = {
    Application = var.application
    Environment = var.environment
  }
}
