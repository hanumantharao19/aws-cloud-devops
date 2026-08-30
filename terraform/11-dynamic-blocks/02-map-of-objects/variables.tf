variable "region" {
  default = "us-east-1"
}

variable "vpc_id" {
  type = string
}

variable "ingress_rules" {
  type = map(object({
    port        = number
    description = string
  }))

  default = {
    ssh = {
      port        = 22
      description = "SSH"
    }

    http = {
      port        = 80
      description = "HTTP"
    }

    https = {
      port        = 443
      description = "HTTPS"
    }
  }
}
