## What is an Application in Argo CD?
- An Application is the core custom resource in Argo CD that defines what to deploy, from where, and to which cluster/namespace.

- It represents the link between:
    - A Git repository (desired state)
    - A Kubernetes cluster (actual state)

## Argo CD Application Components
- An Application consists of:
   - Source → Git repository and path
   - Destination → Cluster and namespace
   - Project → Security and RBAC boundary
   - Sync Policy → How deployments are applied

- Basic Application YAML Example
```
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: sample-app
  namespace: argocd
spec:
  project: default

  source:
    repoURL: https://github.com/org/app-manifests
    targetRevision: main
    path: k8s

  destination:
    server: https://kubernetes.default.svc
    namespace: app

  syncPolicy:
    automated:
      prune: true
      selfHeal: true
```
## Application Source Types
- Argo CD supports multiple source formats:
   - Plain YAML
   - Helm
   - Kustomize
   - Jsonnet


## Application Status and Health
- Argo CD continuously tracks:
  - Sync Status
     - Synced
     - OutOfSync
  - Health Status
     - Healthy
     - Degraded
     - Progressing

- These statuses are visible in:
   - Argo CD UI
   - CLI
   - API
## Sync Types
- Manual Sync
  - User triggers deployment manually
  - Used for sensitive environments
  ```
  argocd app sync sample-app
  ```
- Automated Sync
  - Argo CD automatically deploys changes
  - Common for non-prod environments
  ```
   syncPolicy:
      automated: {}
  ```
## Prune and Self-Heal
- Prune
  - Removes resources deleted from Git
  - Prevents orphaned resources
  ```
  prune: true
  ```
- Self-Heal
  - Reverts manual changes made in cluster
  - Enforces Git as source of truth

## Sync Waves
- Sync waves control deployment order.
- Example
```
metadata:
  annotations:
    argocd.argoproj.io/sync-wave: "1"
```
- Use cases:
  - Deploy CRDs before applications
  - Control dependency order

## Rollbacks
- Rollback is achieved by:
   - Reverting Git commit
   - Syncing application again
- Argo CD will reconcile the cluster back to the previous state.

