# Class 13 — Terraform Import

## What is Terraform Import?

Terraform Import is used to bring an **existing AWS resource** under Terraform management.

In this example, we will create an S3 bucket manually in AWS and import it into Terraform.

---

## Step 1 — Create S3 Bucket Manually

Create an S3 bucket from the AWS Console.

Example:

```text
hanu-terraform-import-demo-2026
```

Do **not** create this bucket using Terraform.

---

## Step 2 — Create `main.tf`

```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "existing" {
  bucket = "hanu-terraform-import-demo-2026"
}
```

---

## Step 3 — Initialize Terraform

```bash
terraform init
```

---

## Step 4 — Check State

```bash
terraform state list
```

The S3 bucket will not be present because Terraform is not managing it yet.

---

## Step 5 — Import Existing Bucket

```bash
terraform import aws_s3_bucket.existing hanu-terraform-import-demo-2026
```

Here:

```text
aws_s3_bucket.existing
        ↓
Terraform resource address

hanu-terraform-import-demo-2026
        ↓
Existing AWS resource
```

---

## Step 6 — Verify Import

```bash
terraform state list
```

Now you should see:

```text
aws_s3_bucket.existing
```

---

## Step 7 — View State

```bash
terraform state show aws_s3_bucket.existing
```

---

## Step 8 — Run Plan

```bash
terraform plan
```

If the Terraform configuration matches the existing S3 bucket:

```text
No changes.
```

Terraform will **not create another bucket**.

---

## Important Concept

```text
Existing AWS Resource
        ↓
terraform import
        ↓
Terraform State
        ↓
terraform plan
        ↓
No changes
```

> **Import brings an existing resource into Terraform state; it does not create the resource.**

## Important Commands

```bash
terraform init

terraform state list

terraform import aws_s3_bucket.existing BUCKET_NAME

terraform state show aws_s3_bucket.existing

terraform plan
```

