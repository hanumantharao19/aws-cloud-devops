- Argo CD Projects provide logical isolation, security boundaries, and governance for applications.
- They are used to control who can deploy what, from where, and to which cluster/namespace.
- RBAC in Argo CD defines who can perform which actions on applications, projects, and cluster

## What is an Argo CD Project?
- A Project is a custom resource that:
   - Groups related applications
   - Restricts source repositories
   - Restricts target clusters and namespaces
   - Defines allowed Kubernetes resources
   - Acts as a security boundary
- By default, all applications belong to the default project.

## Why Projects are Important
- Without projects:
   - Any app can deploy anywhere
   - No environment isolation
   - High blast radius

- With projects:
   - Strong multi-team separation
   - Safer production deployments
   - Better compliance and auditing
## Project YAML Example
```
apiVersion: argoproj.io/v1alpha1
kind: AppProject
metadata:
  name: prod-project
  namespace: argocd
spec:
  description: Production applications

  sourceRepos:
    - https://github.com/org/prod-apps

  destinations:
    - server: https://kubernetes.default.svc
      namespace: prod

  clusterResourceWhitelist:
    - group: ""
      kind: Namespace

  namespaceResourceWhitelist:
    - group: apps
      kind: Deployment
```
## Argo CD RBAC Overview
- Argo CD RBAC controls:
   - UI access
   - CLI access
   - API permissions

- RBAC is defined using:
   - Roles
   - Policies
   - JWT tokens

## Authentication Integration
- Argo CD integrates with:
   - GitHub OAuth
   - GitLab
   - SSO / OIDC
   - LDAP
- RBAC maps users/groups to roles.