## What is a Runner?
- A runner is a server or virtual machine that executes the jobs defined in a GitHub Actions workflow.
- Each job runs in a fresh, isolated environment on a runner.

## Types of Runners
  ## GitHub-Hosted Runners
   - Provided and managed by GitHub.
   - ubuntu-latest
   - windows-latest
   - macos-latest
   - Characteristics:
      - Preinstalled tools (Git, Docker, Terraform, cloud CLIs)
      - Automatically patched and maintained 
      - Ephemeral (destroyed after job completion)
   ```
   runs-on: ubuntu-latest
   ```
   ## Self-Hosted Runners
   - Managed by the organization or team.
   - Use cases:
     - Custom tools or software versions
     - Access to private networks
     - Compliance or security requirements
     - Long-running or resource-intensive jobs
  ```
   runs-on: self-hosted
  ```
## Job Basics
- A job is a collection of steps that run on the same runner.
- key points:
   - Each job runs on one runner
   - Jobs execute independently by default
   - Jobs can be chained using needs
```
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - run: echo "Build step"
```
## Job Isolation
- Jobs do not share state by default
- Files, environment variables, and runtime context are isolated
- Artifacts must be explicitly shared
  - Use case:
     - Prevents cross-job contamination
     - Improves reliability and security
## Parallel vs Sequential Jobs
- Parallel Jobs (Default)
```
jobs:
  lint:
    runs-on: ubuntu-latest

  test:
    runs-on: ubuntu-latest
```
- Sequential Jobs
```
jobs:
  plan:
    runs-on: ubuntu-latest

  apply:
    runs-on: ubuntu-latest
    needs: plan
```
- Used commonly in:
   - Terraform plan → apply
   - Build → deploy pipelines

## Job Outputs
- Jobs can produce outputs that are consumed by dependent jobs.
```
jobs:
  plan:
    outputs:
      tf_plan_status: ${{ steps.plan.outcome }}

  apply:
    needs: plan
    runs-on: ubuntu-latest
```
- Used for:
   - Conditional deployments
   - Environment promotion logic
## Matrix Jobs
- Matrix strategy allows running the same job with multiple configurations.
```
strategy:
  matrix:
    env: [dev, stage, prod]
```
- Use cases:
  - Multi-environment deployments
  - Multi-version testing
  - Multi-region Terraform plans


  │   ├── 01-introduction.md
│   ├── 02-workflow-basics.md
│   ├── 03-runners-and-jobs.md
│   ├── 04-actions-and-marketplace.md
│   ├── 05-secrets-and-variables.md
│   ├── 06-environments-and-approvals.md
│   ├── 07-terraform-ci-cd.md
│   ├── 08-aws-terraform-pipeline.md
│   ├── 09-gcp-terraform-pipeline.md
│   ├── 10-best-practices.md
│   └── 11-interview-questions.md