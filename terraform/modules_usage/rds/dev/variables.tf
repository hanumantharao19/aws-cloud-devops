variable "region" {
  type        = string
  description = "AWS region"
}

variable "project" {
  type        = string
  description = "Application/project name"
}

variable "environment" {
  type        = string
  description = "Environment name"
}


# ============================================================
# VPC
# ============================================================

variable "vpcs" {
  description = "VPC configuration"

  type = map(object({

    vpc_cidr = string

    public_subnets = map(object({
      cidr = string
      az   = string
    }))

    private_subnets = map(object({
      cidr    = string
      az      = string
      nat_key = optional(string)
    }))

    enable_nat_gateway = bool

    single_nat_gateway = bool
  }))
}


# ============================================================
# RDS
# ============================================================

variable "db_username" {
  type        = string
  description = "RDS master username"
}

variable "engine_version" {
  type        = string
  description = "PostgreSQL engine version"
  default     = "17"
}

variable "instance_class" {
  type        = string
  description = "RDS instance class"
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  type        = number
  description = "Initial RDS storage in GiB"
  default     = 20
}

variable "max_allocated_storage" {
  type        = number
  description = "Maximum RDS storage in GiB"
  default     = 100
}

variable "multi_az" {
  type        = bool
  description = "Enable Multi-AZ"
  default     = false
}

variable "backup_retention_period" {
  type        = number
  description = "Automated backup retention period"
  default     = 7
}

variable "deletion_protection" {
  type        = bool
  description = "Protect RDS from accidental deletion"
  default     = false
}

variable "skip_final_snapshot" {
  type        = bool
  description = "Skip final snapshot when destroying RDS"
  default     = true
}

variable "allowed_security_group_ids" {
  type        = list(string)
  description = "Security groups allowed to access RDS"
  default     = []
}