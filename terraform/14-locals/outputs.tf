output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "subnet_id" {
  description = "Subnet ID"
  value       = aws_subnet.main.id
}

output "security_group_id" {
  description = "Security Group ID"
  value       = aws_security_group.main.id
}

output "instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.web.id
}

output "name_prefix" {
  description = "Common name prefix created using local"
  value       = local.name_prefix
}

output "common_tags" {
  description = "Common tags created using local"
  value       = local.common_tags
}
