
variable "tags" {

    default = {
        env = "dev"
        domain = "finance"
        owner = "hanu"
        Name = "dev-mhr-security-group"
    }
  
}

variable "ami" {
  default = "ami-00ca32bbc84273381"
}


variable "vpc_id" {
  default = ""
}
variable "subnet_id" {
  default = ""
}

variable "security-group_name" {
  default = ""
}



variable "region" {
  default = ""
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ingress_rules" {
  description = "List of ingress rules"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      description = "HTTP"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "SSH"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}
