provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "instance" {
  count         = 3
  ami           = "ami-081b0a6eac00b4f53"
  instance_type = "t2.micro"

  tags = {
    Name = "dev-server-${count.index}"
  }
}
