output "bk-name" {
  value = random_id.name.hex
}

output "bucket-name" {
  value = aws_s3_bucket.bucket.id
}

