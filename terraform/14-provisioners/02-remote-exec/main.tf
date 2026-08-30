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

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y nginx",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
  }

  tags = {
    Name = "remote-exec-demo"
  }
}
