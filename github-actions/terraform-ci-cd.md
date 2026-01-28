## What is Terraform CI/CD?
- Terraform CI/CD is the practice of automating infrastructure provisioning and changes using Continuous Integration and Continuous Deployment pipelines.
- GitHub Actions is commonly used to automate Terraform init, validate, plan, and apply in a controlled and auditable manner.


## Why Use CI/CD for Terraform?
- Using CI/CD for Terraform ensures:
  - Consistent and repeatable infrastructure deployments
  - Reduced manual errors
  - Controlled production changes
  - Auditability and traceability of infrastructure changes
## GitHub Actions Terraform Workflow Example
```
name: Terraform CI/CD

on:
  pull_request:
  workflow_dispatch:

jobs:
  terraform-plan:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: hashicorp/setup-terraform@v3
      - run: terraform init
      - run: terraform validate
      - run: terraform plan

  terraform-apply:
    needs: terraform-plan
    runs-on: ubuntu-latest
    environment: prod
    steps:
      - uses: actions/checkout@v4
      - uses: hashicorp/setup-terraform@v3
      - run: terraform init
      - run: terraform apply -auto-approve
```