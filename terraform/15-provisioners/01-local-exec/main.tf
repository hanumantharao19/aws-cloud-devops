provider "aws" {
  region = var.region
}

resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]

  associate_public_ip_address = true

  provisioner "local-exec" {
    command = "bash notify.sh ${self.id} ${self.public_ip}"
  }

  tags = {
    Name = "local-exec-demo"
  }
}
