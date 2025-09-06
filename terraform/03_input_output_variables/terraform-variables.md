# Understanding Terraform Variables

## 1. Why Use Variables?
In Terraform, variables make configurations **dynamic, reusable, and maintainable**.  
Instead of hardcoding values like AMI IDs, regions, or instance types directly in `.tf` files, we use variables so that:

- Configurations can be reused across **multiple environments** (dev, staging, prod).  
- Teams can **change values without editing the main code**.  
- Infrastructure code remains **clean, flexible, and easier to maintain**.  

---

## 2. Input Variables
**Definition:**  
Input variables in Terraform act like **parameters**. They allow you to **pass values into your configuration**.  

### Benefits:
- Avoid hardcoding.  
- Enable reusability (same code for different environments).  
- Provide flexibility in provisioning. 
```
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

```
```
resource "aws_instance" "demo" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  tags = {
    Name = var.instance_name
  }
}
```
- var.instance_type pulls value from the variable.
- We don’t hardcode "t2.micro" inside the resource.

## 3. Output Variables
- Definition:
  - Output variables act like return values from your Terraform configuration. They allow you to expose useful information after resources are created.

- Benefits:
  - View important resource attributes (like IPs, IDs).
  - Pass values between modules.
  - Provide outputs for automation pipelines.
```
output "example_output" {
  description = "Example output variable"
  value       = resource_type.resource_name.attribute
}
```
# 4. terraform.tfvars

Definition:
The terraform.tfvars file is used to supply values for input variables automatically.

- Terraform automatically looks for these files:

  - terraform.tfvars
  - terraform.tfvars.json
  - Any file with the .auto.tfvars or .auto.tfvars.json extension
  - These are loaded automatically when you run terraform plan or terraform apply.

- Important Notes:
  -  terraform.tfvars is not mandatory.
  - You can use any file name, but then you must pass it explicitly:
  ```
  terraform apply -var-file="custom.tfvars"
  ```
- Common convention: Use environment-specific variable files, e.g.:
  - dev.tfvars,staging.tfvars,prod.

```
cat terraform.tfvars
aws_region    = "us-east-1"
ami_id        = "ami-0c55b159cbfafe1f0"
instance_name = "Demo-EC2"
instance_type = "t2.micro"
subnet_id     = "subnet-12345678"
```