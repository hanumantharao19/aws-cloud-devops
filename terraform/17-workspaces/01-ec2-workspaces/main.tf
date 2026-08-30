terraform {
  backend "s3" {
    bucket = "hanu-terraform-state-2026"
    key    = "workspaces/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "server" {

  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name        = "${terraform.workspace}-server"
    Environment = terraform.workspace
  }
}
