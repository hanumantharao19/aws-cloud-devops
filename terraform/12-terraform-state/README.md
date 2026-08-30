# Class 12 — Terraform State

## What is Terraform State?

Terraform state is the record Terraform maintains about
the infrastructure it manages.

The default local state file is:

terraform.tfstate

## 1. Initialize Terraform

terraform init

## 2. Plan

terraform plan

## 3. Apply

terraform apply

After apply, Terraform creates:

terraform.tfstate

## 4. View State

terraform state list

Shows resources managed by Terraform.

## 5. Show Resource State

terraform state show aws_s3_bucket.demo

Shows detailed information about the resource.

## 6. Pull State

terraform state pull

Displays the current state data.

## 7. Rename Terraform Resource

Change:

resource "aws_s3_bucket" "demo"

to:

resource "aws_s3_bucket" "storage"

Without updating state, Terraform may think the old
resource was removed and a new resource was created.

Use:

terraform state mv aws_s3_bucket.demo aws_s3_bucket.storage

Then:

terraform plan

Terraform should understand that the resource was renamed
rather than recreated.

## 8. Terraform State Remove

terraform state rm aws_s3_bucket.storage

This removes the resource from Terraform state.

It does not normally delete the actual AWS resource.

Be careful when using this command.

## 9. Terraform Drift

Drift occurs when the real infrastructure is changed
outside Terraform.

Example:

1. Create the S3 bucket using Terraform.
2. Change a tag manually in AWS.
3. Run:

terraform plan

Terraform detects the difference between the configuration,
state, and real infrastructure.

## Important State Commands

terraform state list
terraform state show
terraform state pull
terraform state mv
terraform state rm

## Important Rule

Do not manually edit terraform.tfstate.

Terraform should manage the state file.
