provider "aws" {
  region = "us-east-1"
}

# 1. Create IAM Role
resource "aws_iam_role" "app_role" {
  name = "terraform-app-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })
}

# 2. Attach IAM Policy to the IAM Role
resource "aws_iam_role_policy" "app_policy" {
  name = "terraform-app-policy"

  role = aws_iam_role.app_role.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect   = "Allow"
        Action   = "s3:ListAllMyBuckets"
        Resource = "*"
      }
    ]
  })
}

# 3. Create IAM Instance Profile
# This connects the IAM Role to the EC2 instance
resource "aws_iam_instance_profile" "app_profile" {
  name = "terraform-app-instance-profile"

  role = aws_iam_role.app_role.name
}

# 4. Create EC2 Instance and Attach Instance Profile
resource "aws_instance" "app" {
  ami           = "ami-081b0a6eac00b4f53"
  instance_type = "t2.micro"

  # Attach IAM Instance Profile to EC2
  iam_instance_profile = aws_iam_instance_profile.app_profile.name

  # Create EC2 only after the IAM policy is attached to the role
  depends_on = [
    aws_iam_role_policy.app_policy
  ]

  tags = {
    Name = "app-server"
  }
}