output "instance_ids" {
  description = "EC2 instance IDs"
  value = {
    for name, instance in aws_instance.instance :
    name => instance.id
  }
}

output "instance_types" {
  description = "EC2 instance types"
  value = {
    for name, instance in aws_instance.instance :
    name => instance.instance_type
  }
}

output "instance_public_ips" {
  description = "EC2 public IP addresses"
  value = {
    for name, instance in aws_instance.instance :
    name => instance.public_ip
  }
}
