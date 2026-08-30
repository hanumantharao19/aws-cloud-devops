# Class 16 — Terraform Remote State

## What is Remote State?

Remote state stores the Terraform state file in a remote backend
instead of keeping it only on the local machine.

## Backend

This example uses Amazon S3 as the Terraform backend.

## Flow

Terraform
    ↓
S3 Backend
    ↓
terraform.tfstate

## Step 1

Create the backend S3 bucket manually:

hanu-terraform-state-2026

## Step 2

Run:

terraform init

## Step 3

Run:

terraform plan

## Step 4

Run:

terraform apply

## Verify State

Check the S3 bucket:

hanu-terraform-state-2026
    ↓
dev/
    ↓
terraform.tfstate

## State Commands

terraform state list

terraform state show aws_s3_bucket.demo
