output "ami_id" {
  description = "AMI ID selected by Terraform"
  value       = data.aws_ami.amazon_linux.id
}

output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.instance.id
}
