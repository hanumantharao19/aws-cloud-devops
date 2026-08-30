# Class 17 — Terraform Workspaces

## What is a Workspace?

A Terraform workspace allows the same Terraform configuration
to use separate state files.

Example:

dev
qa
prod

Each workspace has its own state.

## Initialize Terraform

terraform init

## Check Current Workspace

terraform workspace show

## List Workspaces

terraform workspace list

## Create DEV Workspace

terraform workspace new dev

## Create QA Workspace

terraform workspace new qa

## Switch Workspace

terraform workspace select dev

terraform workspace select qa

## Apply

terraform apply

## Check Output

terraform output

## Important Concept

The same Terraform code is used for DEV and QA.

terraform.workspace returns the current workspace name.

Example:

dev → dev-server

qa → qa-server
