provider "aws" {
  region = "us-east-1"
}

# Find the default VPC in the AWS account
data "aws_vpc" "default" {
  default = true
}

# Find all subnets associated with the default VPC
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}
