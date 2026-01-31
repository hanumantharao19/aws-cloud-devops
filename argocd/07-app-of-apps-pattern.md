- The App of Apps pattern is a GitOps design approach where a parent Argo CD Application manages multiple child Applications.
- Instead of Argo CD directly managing workloads, it manages Application manifests, which in turn manage workloads.

- This enables:
   - Scalable application management
   - Environment consistency
   - Centralized control


## Why App of Apps is Needed
- As environments grow:
   - Managing many applications individually becomes complex
   - Consistency across environments is hard
   - Onboarding new services takes time
- App of Apps solves this by:
   - Using one root application per environment
   - Defining all child apps declaratively in Git

## How App of Apps Works
```
Root Application
   ├── app-1 (Application CR)
   ├── app-2 (Application CR)
   ├── app-3 (Application CR)
```
- Argo CD:
   - 1. Syncs the root application
   - 2. Creates child applications
   - 3. Each child app manages its own resources

## Repository Structure Example
```
gitops-repo/
├── environments/
│   ├── dev/
│   │   ├── root-app.yaml
│   │   ├── app1.yaml
│   │   └── app2.yaml
│   └── prod/
│       ├── root-app.yaml
│       ├── app1.yaml
│       └── app2.yaml
```
## Root Application Example
```
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: dev-root
  namespace: argocd
spec:
  project: dev-project

  source:
    repoURL: https://github.com/org/gitops-repo
    targetRevision: main
    path: environments/dev

  destination:
    server: https://kubernetes.default.svc
    namespace: argocd

  syncPolicy:
    automated:
      prune: true
      selfHeal: true
```
## Child Application Example
```
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: app1
  namespace: argocd
spec:
  project: dev-project

  source:
    repoURL: https://github.com/org/app1-manifests
    targetRevision: main
    path: k8s

  destination:
    server: https://kubernetes.default.svc
    namespace: app1
```

## Benefits of App of Apps
- Centralized environment control
- Easy onboarding of new applications
- Consistent configuration across environments
- Simple rollback by reverting Git commit
- Reduced operational overhead
