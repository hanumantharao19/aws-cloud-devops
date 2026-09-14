variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "ami" {
  description = "AMI ID used to create EC2 instances"
  type        = string
}

variable "instances" {
  description = "EC2 instance names and instance types"
  type        = map(string)
}
