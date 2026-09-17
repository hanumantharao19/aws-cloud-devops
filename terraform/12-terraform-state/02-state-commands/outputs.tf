output "ecr_repository_name" {
  description = "ECR repository name"
  value       = aws_ecr_repository.app.name
}

output "ecr_repository_url" {
  description = "ECR repository URL"
  value       = aws_ecr_repository.app.repository_url
}

output "s3_bucket_name" {
  description = "S3 bucket name"
  value       = aws_s3_bucket.demo.bucket
}

output "ec2_instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.app.id
}

output "ec2_public_ip" {
  description = "EC2 public IP address"
  value       = aws_instance.app.public_ip
}
