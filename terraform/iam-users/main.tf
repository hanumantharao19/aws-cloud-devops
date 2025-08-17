terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
  }

  backend "s3" {
    bucket         = "mhr-dev-bkt-d7a9974b7f4a0149"
    key            = "aws-s3/dev-env/terraform.tfstate"
    region         = "us-east-2"
  }

}

provider "aws" {
  region = "us-east-1"
}

locals {
  users_data = yamldecode(file("./users.yaml")).users
  

}


resource "aws_iam_user" "users" {
  for_each = toset(local.users_data[*].username)
  name     = each.key
}


resource "aws_iam_user_login_profile" "profile" {
  for_each        = aws_iam_user.users
  user            = each.value.name
  password_length = 8

  lifecycle {
    ignore_changes = [
      password_length,
      password_reset_required,
      pgp_key,
    ]
  }
}

