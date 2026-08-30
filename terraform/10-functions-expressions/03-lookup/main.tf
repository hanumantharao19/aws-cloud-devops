provider "aws" {
  region = "us-east-1"
}

variable "environment" {
  default = "dev"
}

variable "instance_type" {
  default = {
    dev  = "t2.micro"
    qa   = "t2.small"
    prod = "t3.medium"
  }
}

resource "aws_instance" "app" {
  ami = "YOUR_AMI_ID"

  instance_type = lookup(
    var.instance_type,
    var.environment,
    "t2.micro"
  )

  tags = {
    Name        = "${var.environment}-server"
    Environment = var.environment
  }
}
