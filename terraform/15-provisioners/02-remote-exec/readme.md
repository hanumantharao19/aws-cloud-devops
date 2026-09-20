# 02 - Remote Exec

## Overview

In this example, Terraform creates an AWS EC2 infrastructure and uses the **remote-exec provisioner** to connect to the EC2 instance through SSH and install Nginx.

## What Terraform Creates

* VPC
* Internet Gateway
* Public Subnet
* Route Table
* Security Group
* EC2 Instance
* Nginx

## Remote Execution Flow

```text
Terraform
    ↓
Create AWS Infrastructure
    ↓
Create EC2 Instance
    ↓
Connect to EC2 using SSH
    ↓
remote-exec
    ↓
Install Nginx
    ↓
Start Nginx
```

## Prerequisites

Before running this example:

* AWS account
* AWS CLI configured
* Terraform installed
* EC2 key pair created
* `.pem` private key available locally
* Amazon Linux AMI ID

## Files

```text
02-remote-exec/
├── main.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
└── README.md
```

## Commands

Initialize Terraform:

```bash
terraform init
```

Format files:

```bash
terraform fmt
```

Validate configuration:

```bash
terraform validate
```

Review the plan:

```bash
terraform plan
```

Create infrastructure:

```bash
terraform apply
```

Check outputs:

```bash
terraform output
```

Access Nginx using the output public IP:

```text
http://<PUBLIC-IP>
```

Destroy the infrastructure after the lab:

```bash
terraform destroy
```

## Important

`remote-exec` connects to the EC2 instance using SSH and executes commands remotely.

Provisioners should generally be used as a **last resort** in production Terraform. For many real-world use cases, alternatives such as user data/cloud-init, AWS Systems Manager, or configuration-management tools are preferred.

