## What is a Workflow?
- A workflow is an automated process defined using a YAML file that runs in response to one or more GitHub events.
- Workflows are used to implement CI/CD pipelines, infrastructure automation, and operational tasks.

## Workflow File Location
- All GitHub Actions workflows must be stored in:
```
.github/workflows/
```
## Each workflow file:
- Uses the .yml or .yaml extension
- Is independent and can have its own triggers and jobs

```
name: Sample Workflow

on:
  push:
    branches:
      - main

jobs:
  example-job:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Run a command
        run: echo "Hello GitHub Actions"
```
## Key Workflow Components
## name
  - Human-readable name shown in the GitHub Actions UI
  - Optional but recommended for clarity
##  on (Triggers)
  ## Common triggers:
  - push
  - pull_request
  - workflow_dispatch (manual)
  - schedule (cron)
- example:
```
on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]
```
## jobs
- A workflow contains one or more jobs.
  - Jobs run in parallel by default
  - Jobs can be made sequential using needs
  - Each job runs on a separate runner

## runs-on

- Specifies the type of runner:
  - ubuntu-latest (most common)
  - windows-latest
  - macos-latest
  - self-hosted
- example
```
runs-on: ubuntu-latest
```

## steps
- Steps are executed sequentially within a job.
- types of steps
  - uses → calls an existing action
  - run → executes shell commands
```
steps:
  - uses: actions/checkout@v4
  - run: terraform version
```
## Sequential Jobs Using needs
```
jobs:
  terraform-plan:
    runs-on: ubuntu-latest

  terraform-apply:
    runs-on: ubuntu-latest
    needs: terraform-plan
```
- Use case:
  - Run terraform plan first
  - Apply only if plan succeeds

## Environment Variables in Workflows
- Workflow-level
```
env:
  TF_VERSION: "1.6.6"
```
- Job-level
```
jobs:
  example:
    env:
      ENV: dev
```
- Step-level
```
- run: echo $ENV
```
## Manual Trigger (workflow_dispatch)
- Allows triggering workflows manually from GitHub UI.
```
on:
  workflow_dispatch:
```
- Used commonly for:
  - Terraform apply
  - Production deployments
  - One-time operations