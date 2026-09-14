provider "aws" {
  region = var.region
}

resource "aws_instance" "instance" {
  for_each = var.instances

  ami           = var.ami
  instance_type = each.value

   lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = each.key
  }
}
