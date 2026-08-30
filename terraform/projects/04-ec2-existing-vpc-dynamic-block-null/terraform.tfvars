ami = "ami-00ca32bbc84273381"
vpc_id = "vpc-06ea34ec968b083b4"
subnet_id = "subnet-0e5476bf26a2022c4"
region = "us-east-1"
security-group_name = "dev-mhr-security-group"

ingress_rules = [
  {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
]

