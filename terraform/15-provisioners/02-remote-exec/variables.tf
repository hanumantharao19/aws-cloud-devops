variable "region" {
  type        = string
  description = "AWS region"
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
  description = "Local path to the SSH private key"
}