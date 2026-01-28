## What are Environments?
- Environments in GitHub Actions represent deployment targets such as dev, stage, and prod.
- They provide environment-specific configuration, secrets, and protection rules for workflows.

- Environments are commonly used to:
    - Separate non-production and production deployments
    - Control access to sensitive credentials
    - Enforce manual approvals before critical changes
## Why Use Environments?
- Environments add governance and safety to CI/CD pipelines.
- Key benefits:
   - Environment-level secrets and variables
   - Manual approval gates
   - Role-based access control
   - Deployment audit history

- Defining an Environment in a Workflow
```
jobs:
  deploy:
    runs-on: ubuntu-latest
    environment: prod
```
- When a job references an environment:
   - Environment secrets become available
   - Protection rules are enforced
   - Approval is required (if configured)

## Environment-Level Secrets and Variables
- Each environment can have its own:
   - Secrets (e.g., prod cloud credentials)
   - Variables (e.g., region, project ID)

- Benefits:
   - Prevents accidental cross-environment access
   - Enables different cloud accounts or projects
   - Improves security posture

## Manual Approvals (Protection Rules)

- GitHub allows configuring required reviewers for environments.
- Use cases:
   - Terraform apply to production
   - Database migrations
   - Infrastructure changes
- Flow:
   - Workflow pauses at the protected environment
   - Reviewer approves deployment
   - Job continues execution

