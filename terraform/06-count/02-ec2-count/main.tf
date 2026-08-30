provider "aws" {
  region = var.region
}

resource "aws_instance" "instance" {
  count = length(var.instance_names)

  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = var.instance_names[count.index]
  }
}
