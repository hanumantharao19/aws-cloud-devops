provider "aws" {
  region = var.region
}

# --------------------------------------------------
# Local values
# --------------------------------------------------

locals {
  # Common values used by multiple resources
  name_prefix = "${var.project_name}-${var.environment}"

  # Common tags
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }

  # Resource names
  vpc_name            = "${local.name_prefix}-vpc"
  subnet_name         = "${local.name_prefix}-subnet"
  security_group_name = "${local.name_prefix}-sg"
  instance_name       = "${local.name_prefix}-ec2"
}

# --------------------------------------------------
# VPC
# --------------------------------------------------

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = merge(local.common_tags, {
    Name = local.vpc_name
  })
}

# --------------------------------------------------
# Subnet
# --------------------------------------------------

resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.availability_zone

  tags = merge(local.common_tags, {
    Name = local.subnet_name
  })
}

# --------------------------------------------------
# Security Group
# --------------------------------------------------

resource "aws_security_group" "main" {
  name   = local.security_group_name
  vpc_id = aws_vpc.main.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, {
    Name = local.security_group_name
  })
}

# --------------------------------------------------
# EC2 Instance
# --------------------------------------------------

resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id              = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.main.id]

  tags = merge(local.common_tags, {
    Name = local.instance_name
  })
}
