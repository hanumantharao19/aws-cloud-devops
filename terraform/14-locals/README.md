# Terraform Locals

## What are Locals?

Terraform `locals` are used to define a value once and reuse it multiple times in the Terraform configuration.

## Why do we use Locals?

Without locals, we may repeat the same values in multiple resources.

### Without Locals

```hcl
resource "aws_vpc" "main" {
  tags = {
    Project     = "ecommerce"
    Environment = "dev"
    ManagedBy   = "Terraform"
    Name        = "ecommerce-dev-vpc"
  }
}

resource "aws_subnet" "main" {
  tags = {
    Project     = "ecommerce"
    Environment = "dev"
    ManagedBy   = "Terraform"
    Name        = "ecommerce-dev-subnet"
  }
}
```

The same tags are repeated.

### With Locals

Define the common values once:

```hcl
locals {
  name_prefix = "${var.project_name}-${var.environment}"

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
```

Reuse them:

```hcl
tags = merge(local.common_tags, {
  Name = "${local.name_prefix}-vpc"
})
```

```hcl
tags = merge(local.common_tags, {
  Name = "${local.name_prefix}-subnet"
})
```

This avoids repetition and makes the configuration easier to maintain.

---

## Variables vs Locals

### Variables

Variables are **input values** provided from outside the Terraform configuration.

```hcl
variable "environment" {
  type = string
}
```

Value can be provided in `terraform.tfvars`:

```hcl
environment = "dev"
```

### Locals

Locals are **values defined or calculated inside Terraform** using variables or other values.

```hcl
locals {
  name_prefix = "${var.project_name}-${var.environment}"
}
```

If:

```text
project_name = ecommerce
environment  = dev
```

Then:

```text
local.name_prefix = ecommerce-dev
```

---

## Simple Difference

| Variables                        | Locals                            |
| -------------------------------- | --------------------------------- |
| Input values                     | Reusable/calculated values        |
| Usually provided from outside    | Defined inside Terraform          |
| `var.environment`                | `local.name_prefix`               |
| Can be changed through `.tfvars` | Usually calculated from variables |
| Used to customize configuration  | Used to avoid repetition          |

## Key Syntax

Define a local:

```hcl
locals {
  name = "ecommerce-dev"
}
```

Use a local:

```hcl
local.name
```

## Commands

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform destroy
```

