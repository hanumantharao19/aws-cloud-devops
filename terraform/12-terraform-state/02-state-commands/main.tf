provider "aws" {
  region = var.aws_region
}

# Get the default VPC
data "aws_vpc" "default" {
  default = true
}

# Get a subnet from the default VPC
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# ECR Repository
resource "aws_ecr_repository" "app" {
  name                 = var.ecr_repository_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name        = var.ecr_repository_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# S3 Bucket
resource "aws_s3_bucket" "demo" {
  bucket = var.s3_bucket_name

  tags = {
    Name        = var.s3_bucket_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# EC2 Instance
resource "aws_instance" "app" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = data.aws_subnets.default.ids[0]

  tags = {
    Name        = var.instance_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}