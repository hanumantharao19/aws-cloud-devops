provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "instance" {
    ami = var.instance_details[3]
    instance_type = element(var.instance_details, 0)
}

variable "instance_details" {
    type = list(string)
    default = ["t2.micro","t2.medium","t2.large","ami-0583d8c7a9c35822c"]
  
}
