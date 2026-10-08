provider "aws" {
  region = var.region
}


# ============================================================
# VPC
# ============================================================

module "vpc" {
  source = "../../../modules/vpc"

  for_each = var.vpcs

  vpc_name = "${var.project}-${each.key}-vpc"

  vpc_cidr = each.value.vpc_cidr

  public_subnets = each.value.public_subnets

  private_subnets = each.value.private_subnets

  enable_nat_gateway = each.value.enable_nat_gateway

  single_nat_gateway = each.value.single_nat_gateway
}


# ============================================================
# RDS
# ============================================================

module "rds" {
  source = "../../../modules/rds"

  for_each = var.vpcs

  name        = "${var.project}-${each.key}-rds"
  environment = var.environment

  vpc_id = module.vpc[each.key].vpc_id

  subnet_ids = module.vpc[each.key].private_subnet_ids

  allowed_security_group_ids = var.allowed_security_group_ids

  db_name  = "${var.project}_db"
  username = var.db_username

  engine_version = var.engine_version
  instance_class = var.instance_class

  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage

  multi_az = var.multi_az

  backup_retention_period = var.backup_retention_period

  deletion_protection = var.deletion_protection
  skip_final_snapshot = var.skip_final_snapshot
}