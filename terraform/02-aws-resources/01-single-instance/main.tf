provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_instance" "instance" {
  ami           = "ami-0cdf69fbf2afc0c3c"
  instance_type = "t2.micro"

  tags = {
    Name = "dev-server"
  }
}
