provider "aws" {
  region = "us-east-1"
}

variable "environment" {
  default = "dev"
}

resource "aws_instance" "app" {
  ami = "ami-081b0a6eac00b4f53"

  instance_type = var.environment == "prod" ? "t3.medium" : "t2.micro"

  tags = {
    Name        = "${var.environment}-server"
    Environment = var.environment
  }
}
