
## What is Argo CD?
- Argo CD is a declarative, GitOps-based Continuous Delivery (CD) tool designed specifically for Kubernetes.
- It continuously monitors Kubernetes clusters and ensures that the desired state defined in Git matches the actual state running in the cluster.

- Argo CD follows a pull-based deployment model, where the cluster pulls changes from Git instead of receiving pushes from CI systems.

## Why Argo CD?

- Traditional CD tools push changes into Kubernetes clusters, which introduces security and operational challenges.
- Argo CD solves this by using Git as the single source of truth.

- Key benefits:
   - Native Kubernetes Continuous Delivery
   - Git as the source of truth
   - Pull-based, secure deployment model
   - Automatic drift detection and self-healing
   - Multi-environment and multi-cluster support

## What is GitOps?
- GitOps is an operational model where:
  - All Kubernetes manifests are stored in Git
  - Git represents the desired state
  - Changes are made through pull requests
  - Automated systems reconcile Git with the cluster
- Argo CD is one of the most widely adopted GitOps tools in production environments.

## Core Use Cases
- Continuous delivery for Kubernetes workloads
- Declarative application deployments
- Multi-environment (dev, stage, prod) management
- Multi-cluster Kubernetes deployments
- Drift detection and automated reconciliation

## High-Level Argo CD Workflow
- 1. Developer updates manifests in Git
- 2. Argo CD detects changes
- 3. Argo CD syncs desired state to the cluster
- 4. Cluster state is continuously monitored

## Key Features
- Declarative application management
- Automated sync and rollback
- Application health status
- RBAC and SSO integration
- Helm, Kustomize, and plain YAML support