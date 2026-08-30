provider "aws" {
  region = "us-east-1"
}

module "dev_server" {
  source = "../modules/ec2"

  ami           = "ami-xxxxxxxx"
  instance_type = "t2.micro"
  instance_name = "dev-server"
}
