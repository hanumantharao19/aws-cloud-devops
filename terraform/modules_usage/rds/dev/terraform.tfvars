region      = "us-east-1"
project     = "product"
environment = "dev"


# ============================================================
# VPC
# ============================================================

vpcs = {

  product-dev = {

    vpc_cidr = "10.10.0.0/16"


    # No public subnets required for RDS-only VPC

    public_subnets = {}


    # Two private subnets in two AZs

    private_subnets = {

      private-1 = {
        cidr = "10.10.11.0/24"
        az   = "us-east-1a"
      }

      private-2 = {
        cidr = "10.10.12.0/24"
        az   = "us-east-1b"
      }

    }


    # RDS does not require NAT Gateway

    enable_nat_gateway = false

    single_nat_gateway = false
  }
}


# ============================================================
# RDS
# ============================================================

db_username = "postgres"

engine_version = "17"

instance_class = "db.t3.micro"

allocated_storage     = 20
max_allocated_storage = 100

multi_az = false

backup_retention_period = 7

deletion_protection = false

skip_final_snapshot = true


# ============================================================
# RDS Security Group
# ============================================================

allowed_security_group_ids = []