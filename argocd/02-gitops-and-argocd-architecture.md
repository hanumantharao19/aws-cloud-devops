## Why GitOps for Kubernetes?

- Kubernetes is declarative by design, making it a natural fit for GitOps.
- Benefits:
  - Consistent deployments
  - Easy rollback
  - Reduced configuration drift
  - Improved security
  - Strong audit trail
## Argo CD Architecture Overview
- Argo CD follows a controller-based architecture that runs inside Kubernetes.
- High-level components:
  - API Server
  - Repository Server
  - Application Controller
  - Redis

## Argo CD Components Explained
- Argo CD API Server
   - Exposes REST and gRPC APIs
   - Provides Web UI and CLI access
   - Handles authentication and RBAC
   - Manages application and cluster metadat

- Repository Server (Repo Server)
   - Connects to Git repositories
   - Fetches manifests and Helm charts
   - Renders Kubernetes manifests
   - Caches repository data

- Application Controller
   - Core reconciliation engine
   - Continuously compares desired vs live state
   - Applies changes to the cluster
   - Handles sync, prune, and self-heal operations
- Redis
   - Caching layer
   - Improves performance
   - Stores application state and metadata

## How Argo CD Reconciles State
  - Fetch desired state from Git
  - Compare with live Kubernetes state
  - Detect drift
  - Sync changes automatically or manually
  - Continuously monitor health

## Argo CD Application Custom Resource (CR)
- Argo CD introduces a Kubernetes CRD called Application.
- Responsibilities:
   - Defines source repository
   - Defines destination cluster/namespace
   - Defines sync policy
- This CR is the core unit of deployment in Argo CD.

## Multi-Cluster Architecture
- Argo CD runs in a central cluster
- Manages multiple target clusters
- Uses service accounts and kubeconfig contexts

- Use cases:
  - Large organizations
  - Environment isolation
  - Regional deployments

## Security Model
- No cluster credentials stored in CI
- RBAC controls access
- Git is the audit source
- Supports SSO and OIDC
