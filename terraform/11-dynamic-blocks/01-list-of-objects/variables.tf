variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "Existing VPC ID"
  type        = string
}

variable "ingress_rules" {
  description = "List of inbound security group rules"

  type = list(object({
    port        = number
    description = string
  }))

  default = [
    {
      port        = 22
      description = "SSH"
    },
    {
      port        = 80
      description = "HTTP"
    },
    {
      port        = 443
      description = "HTTPS"
    }
  ]
}
