provider "aws" {
  region = var.region
}

resource "aws_security_group" "mhr_dev_sg" {
  vpc_id = var.vpc_id
  name   = var.security-group_name

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

# -------------------------------
# EC2 Key Pair
# -------------------------------
resource "aws_key_pair" "instance" {
  key_name   = "dev-mhr-instance-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

# -------------------------------
# EC2 Instance
# -------------------------------
resource "aws_instance" "server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.instance.key_name
  vpc_security_group_ids = [aws_security_group.mhr_dev_sg.id]
  subnet_id              = var.subnet_id
  associate_public_ip_address = true
  tags                   = var.tags
}

# -------------------------------
# Null Resource for Provisioners
# -------------------------------
resource "null_resource" "configure_httpd" {
  depends_on = [aws_instance.server]

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
    host        = aws_instance.server.public_ip
  }

  provisioner "file" {
    source      = "index.html"
    destination = "/home/ec2-user/index.html"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y httpd",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
      "cp /home/ec2-user/index.html /var/www/html/index.html"
    ]
  }
}

