## Advanced Automated Sync Options
- Prune
  - Deletes Kubernetes resources removed from Git.
  ```
  automated:
  prune: true
  ```
 - Benefits:
    - Prevents orphaned resources
    - Keeps cluster clean
- Self-Heal
  - Restores resources modified manually in the cluster.
  ```
  automated:
  selfHeal: true
  ```
  Benefits:
    - Prevents configuration drift
    - Enforces Git as the single source of truth
 - Full Automated Policy Example
 ```
 syncPolicy:
  automated:
    prune: true
    selfHeal: true
 ```

## Sync Options
- Sync options provide finer control over deployments.
```
syncPolicy:
  syncOptions:
    - CreateNamespace=true
    - ApplyOutOfSyncOnly=true
    - RespectIgnoreDifferences=true
```
- Common options:
   - CreateNamespace → Auto-create namespaces
   - ApplyOutOfSyncOnly → Skip already synced resources
   - Replace → Replace instead of patch

- Sync Phases
  - During sync, Argo CD applies resources in phases:
     - 1. PreSync
     - 2. Sync
     - 3. PostSync

  - Used for:
     - DB migrations
     - Pre-deployment checks
     - Cleanup tasks

## How Argo CD Determines Health
- Argo CD evaluates:
  - Kubernetes resource conditions
  - Deployment replicas
  - pod readiness
  - Custom health checks

- Example:
  - Deployment healthy only if all replicas are available
  - Pod healthy only if Ready condition is true

## Rollback and Recovery
- Argo CD does not maintain its own rollback history.
  - Rollback is achieved by:
    1. Reverting Git commit
    2. Syncing the application

  - This ensures:
    - Git history remains the source of truth
    - Auditable recovery