# Class 18 — Production Terraform Project Structure

## Objective

Learn how to organize Terraform code using reusable modules
and separate environment configurations.

## Structure

modules/
    ec2/

environments/
    dev/
    qa/

## Module

The EC2 module contains reusable infrastructure code.

## Environment

DEV and QA are separate Terraform root modules.

Each environment has:

- main.tf
- variables.tf
- terraform.tfvars
- outputs.tf

## DEV

cd environments/dev

terraform init
terraform plan
terraform apply

## QA

cd environments/qa

terraform init
terraform plan
terraform apply

## Important Concept

main.tf
    ↓
Infrastructure logic

variables.tf
    ↓
Defines input variables

terraform.tfvars
    ↓
Provides environment-specific values

modules/
    ↓
Reusable Terraform code

environments/
    ↓
Separate root modules
