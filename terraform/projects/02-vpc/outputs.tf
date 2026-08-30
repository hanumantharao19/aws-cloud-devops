output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.vpc.id
}

output "vpc_cidr_block" {
  description = "CIDR block of the VPC"
  value       = aws_vpc.vpc.cidr_block
}

output "subnet_id" {
  description = "ID of the subnet"
  value       = aws_subnet.subnet.id
}

output "subnet_cidr_block" {
  description = "CIDR block of the subnet"
  value       = aws_subnet.subnet.cidr_block
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = aws_internet_gateway.gw.id
}

output "route_table_id" {
  description = "ID of the route table"
  value       = aws_route_table.rt.id
}
