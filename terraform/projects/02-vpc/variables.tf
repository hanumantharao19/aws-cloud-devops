variable "vpc_cidr_block" {
     default = "10.0.0.0/16"
}


variable "vpc_name" {
     default = "dev-vpc"
}


variable "subnet_name" {
     default = "dev-subnet"
}


variable "subnet_cidr_block" {
  default = "10.0.1.0/24"
}

variable "igw_name" {
  default = "dev-igw"
}

variable "rt_name" {
  default = "dev-rt"
}
