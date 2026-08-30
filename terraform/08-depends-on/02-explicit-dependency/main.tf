provider "aws" {
  region = "us-east-1"
}

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

resource "aws_instance" "app" {
  ami           = "YOUR_AMI_ID"
  instance_type = "t2.micro"

  depends_on = [
    aws_iam_role_policy.app_policy
  ]

  tags = {
    Name = "app-server"
  }
}
