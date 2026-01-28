## Why Secrets and Variables Matter

Secrets and variables are used to configure workflows securely and dynamically without hardcoding sensitive or environment-specific values in workflow files.

- They are critical for:
   - Cloud authentication (AWS, GCP)
   - Terraform variables and backend configuration
   - Environment separation (dev, stage, prod)
   - Secure CI/CD pipelines
## Repository Variables
 - Repository-level variables apply to all workflows in a repository.

 - Examples:
   - TF_VERSION
   - ENV 
   - REGION
 - usage
 ```
 env:
  TF_VERSION: ${{ vars.TF_VERSION }}
```
## Repository Secrets
- Repository secrets are encrypted and masked.
- Examples:
   - AWS_ROLE_ARN
   - GCP_PROJECT_ID
   - TF_BACKEND_BUCKET
- usage
```
env:
  AWS_ROLE_ARN: ${{ secrets.AWS_ROLE_ARN }}
```
## Organization-Level Secrets
- Used when secrets are shared across multiple repositories.
- Use cases:
   - Centralized cloud credentials
   - Shared Terraform backends
   - Enterprise-level CI/CD setups
   