## Argo CD Installation and Setup
- Overview
  - This section covers the installation, initial access, and basic setup of Argo CD on a Kubernetes cluster.
  - Argo CD can be installed using kubectl manifests or Helm, with Helm preferred for production environments

- Prerequisites
  - Running Kubernetes cluster (EKS, GKE, AKS, or local)
  - kubectl configured with cluster access
  - Internet access to pull container images
  - Basic understanding of Kubernetes namespaces and services

## Installation Options
- Argo CD supports multiple installation methods:
   - Kubectl (quick setup)
   - Helm (recommended for production)
   - Argo CD Operator

## Install Argo CD Using kubectl
 - Step 1: Create Namespace
 ```
 kubectl create namespace argocd
```
- Step 2: Apply Installation Manifest
```
kubectl apply -n argocd \
  -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```
- This installs:
   - API Server
   - Repo Server
   - Application Controller
   - Redis

- Step 3: Verify Installation
```
kubectl get pods -n argocd
```
 - All pods should be in Running state

## Install Argo CD Using Helm (Recommended)
 - Step 1: Add Helm Repository
 ```
 helm repo add argo https://argoproj.github.io/argo-helm
 helm repo update
```
- Step 2: Install Argo CD
```
helm install argocd argo/argo-cd \
  --namespace argocd \
  --create-namespace
```
 - Benefits of Helm:
    - Easier upgrades
    - Configuration management
    - Production-friendly

## Accessing Argo CD
- Option 1: Port Forward (Quick Access)
```
kubectl port-forward svc/argocd-server -n argocd 8080:443
```
  - Access UI:
  ```
   https://localhost:8080
  ```
- Option 2: LoadBalancer / Ingress (Production)
  - Expose argocd-server via LoadBalancer or Ingress
  - Configure TLS
  - Restrict access using authentication and RBAC

## Initial Login
- Get Admin Password
```
kubectl get secret argocd-initial-admin-secret \
  -n argocd \
  -o jsonpath="{.data.password}" | base64 -d
```
- Username:
```
admin
```

   