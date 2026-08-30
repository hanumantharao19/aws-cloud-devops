
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
