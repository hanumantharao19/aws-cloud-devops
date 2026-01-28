## What is an Action?
- An action is a reusable unit of code that performs a specific task within a GitHub Actions workflow.
- Actions help reduce duplication, improve readability, and standardize CI/CD steps.

- Actions can:
   - Checkout code
   - Set up tools (Terraform, Node, Python, etc.)
   - Authenticate to cloud providers
   - Run custom scripts
## Types of Actions
   ## 1. Official Actions
   - Maintained by GitHub or trusted partners.
       - actions/checkout
       - actions/setup-node
       - hashicorp/setup-terraform
       - google-github-actions/auth
    - Recommended for production use.
    ## 2. Community Actions
    - Created by the open-source community and published in the Marketplace.
      - Terraform linting actions
      - Security scanning actions
      - Slack notification actions
    ## Custom Actions
    - Actions created within your own repository.
    - Used when:
       -  Organization-specific logic is required
       -  Reusable internal workflows are needed
    - Types:
       - JavaScript actions
       - Docker container actions
       - Composite actions
    ## GitHub Marketplace
    - The GitHub Marketplace is a central place to discover, evaluate, and reuse actions.
    - Marketplace benefits:
       - Reduces pipeline development time
       - Encourages best practices
       - Provides versioned and documented actions
    - Best practice:
       - Pin actions to a specific version or SHA
       - Avoid using @main in production
## Using an Action in a Workflow
- example:
```
- name: Checkout repository
  uses: actions/checkout@v4
```
## Setting Up Terraform Using an Action
```
- name: Setup Terraform
  uses: hashicorp/setup-terraform@v3
  with:
    terraform_version: 1.6.6
```
## Authentication Actions (Cloud)
```
- uses: google-github-actions/auth@v2
  with:
    workload_identity_provider: ...
    service_account: ...
```
