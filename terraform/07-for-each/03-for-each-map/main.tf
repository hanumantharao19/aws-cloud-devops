provider "aws" {
  region = var.region
}

resource "aws_instance" "instance" {
  for_each = var.instances

  ami           = var.ami
  instance_type = each.value

  tags = {
    Name = each.key
  }
}
