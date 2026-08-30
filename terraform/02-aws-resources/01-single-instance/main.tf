provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "instance" {
  ami           = "YOUR_AMI_ID"
  instance_type = "t2.micro"

  tags = {
    Name = "dev-server"
  }
}
