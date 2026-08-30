output "instance_ids" {
  description = "IDs of all EC2 instances"
  value       = aws_instance.instance[*].id
}

output "instance_public_ips" {
  description = "Public IP addresses of all EC2 instances"
  value       = aws_instance.instance[*].public_ip
}

output "instance_names" {
  description = "Names of all EC2 instances"
  value       = aws_instance.instance[*].tags["Name"]
}
