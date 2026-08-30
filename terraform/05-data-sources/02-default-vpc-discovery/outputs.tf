output "default_vpc_id" {
  description = "ID of the default VPC"
  value       = data.aws_vpc.default.id
}

output "default_vpc_cidr" {
  description = "CIDR block of the default VPC"
  value       = data.aws_vpc.default.cidr_block
}

output "default_subnet_ids" {
  description = "Subnet IDs associated with the default VPC"
  value       = data.aws_subnets.default.ids
}
