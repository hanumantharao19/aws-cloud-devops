provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {

  ami           = "YOUR_AMI_ID"
  instance_type = "t2.micro"

  subnet_id              = "YOUR_SUBNET_ID"
  vpc_security_group_ids = ["YOUR_SECURITY_GROUP_ID"]

  associate_public_ip_address = true

  key_name = "YOUR_KEY_PAIR"

  provisioner "local-exec" {
    command = "bash notify.sh ${self.id} ${self.public_ip}"
  }

  tags = {
    Name = "local-exec-demo"
  }
}
