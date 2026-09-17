# Terraform State Commands

Terraform state commands are used to **inspect and manage Terraform state**.

## Commands

### 1. List resources

```bash
terraform state list
```

Lists all resources managed by Terraform.

### 2. Show resource details

```bash
terraform state show aws_instance.web
```

Shows details of a specific resource from the state.

### 3. Pull complete state

```bash
terraform state pull
```

Displays the complete state in JSON format.

> Do not commit the state output to Git because it may contain sensitive information.

### 4. Move resource in state

```bash
terraform state mv aws_instance.web aws_instance.app
```

Changes the Terraform **state address** without recreating the actual AWS resource.

> It does not automatically change your `.tf` files.

### 5. Remove resource from state

```bash
terraform state rm aws_s3_bucket.demo
```

Removes the resource from Terraform state **without deleting the actual AWS resource**.

## Important

```text
terraform state commands
        ↓
Manage Terraform State
        ↓
Not directly AWS Infrastructure
```

| Command      | Purpose                    |
| ------------ | -------------------------- |
| `state list` | List resources             |
| `state show` | Show resource details      |
| `state pull` | Get complete state         |
| `state mv`   | Move resource address      |
| `state rm`   | Remove resource from state |
