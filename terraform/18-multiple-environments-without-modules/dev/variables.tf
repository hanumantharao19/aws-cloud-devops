variable "region" {
  type        = string
  description = "AWS region"
}

variable "environment" {
  type        = string
  description = "Environment name"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block"
}

variable "subnet_cidr" {
  type        = string
  description = "Public subnet CIDR block"
}

variable "availability_zone" {
  type        = string
  description = "Availability Zone"
}

variable "ami_id" {
  type        = string
  description = "Amazon Linux AMI ID"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "key_name" {
  type        = string
  description = "AWS EC2 key pair name"
}

variable "private_key_path" {
  type        = string
  description = "Path to private SSH key"
}
