output "instance_ids" {
  description = "EC2 instance IDs"
  value = {
    for name, instance in aws_instance.instance :
    name => instance.id
  }
}

output "instance_public_ips" {
  description = "Public IP addresses of EC2 instances"
  value = {
    for name, instance in aws_instance.instance :
    name => instance.public_ip
  }
}
