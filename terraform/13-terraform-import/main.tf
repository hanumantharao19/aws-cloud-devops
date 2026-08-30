resource "aws_s3_bucket" "existing" {
  bucket = "hanu-existing-bucket-2026"

  tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}
