Kubernetes Storage Reference
1. HostPath Volumes

Definition: Mounts a file or directory from the node’s filesystem into a Pod.

YAML Example:

volumes:
- name: myvol
  hostPath:
    path: /tmp/mydata
    type: DirectoryOrCreate


Pros: Simple, no PV/PVC required, good for demos or single-node clusters.

Cons: Node-specific → data is not shared across nodes.

Use Case: Testing, logging agents, single Pod persistence.

2. PersistentVolume (PV) + PersistentVolumeClaim (PVC)

PV: Represents a piece of storage in the cluster. Can be:

hostPath (local node)

AWS EBS / GCP PD / Azure Disk

NFS, EFS, CephFS, GlusterFS

PVC: Request for storage by a Pod.

Binding: PVC binds to a PV (static or dynamic).

2a. Static Provisioning

Admin creates PV manually.

PVC binds to that PV.

Example (hostPath):

apiVersion: v1
kind: PersistentVolume
metadata:
  name: mysql-pv
spec:
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: /tmp/mysql-data

2b. Dynamic Provisioning (StorageClass)

In most real clusters (EKS, GKE, AKS, even Minikube), there is a default StorageClass.

When you create a PVC without a PV, Kubernetes automatically provisions a PV from that StorageClass.

Vendor-specific defaults:

Vendor	Default StorageClass	Backing Storage
Minikube	standard	hostPath
AWS EKS	gp2	EBS volume
GCP GKE	standard	Persistent Disk
AKS	default	Managed Disk

Example in MySQL + PVC scenario:

We only defined the PVC.

Kubernetes automatically created a PV dynamically because the cluster has a default StorageClass.

That’s why PVC-only YAML works in cloud clusters or Minikube.

YAML Example:

apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: mysql-pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi

3. Access Modes

ReadWriteOnce (RWO): Volume can be mounted read/write by 1 node → only 1 Pod can write at a time.

ReadWriteMany (RWX): Volume can be mounted read/write by multiple nodes → supports multi-Pod usage.

ReadOnlyMany (ROX): Volume can be mounted read-only by multiple nodes.

Examples:

Volume Type	Access Mode	Multi-Pod Support
hostPath	RWO	❌ No
AWS EBS	RWO	❌ No
GCP PD	RWO	❌ No
NFS / EFS	RWX	✅ Yes
4. Storage Behavior by Vendor

Minikube / kind: hostPath → /tmp/hostpath-provisioner/pvc-<uid>/

AWS EKS: EBS → attached to node, persists if Pod rescheduled to same node (dynamic PV)

GCP GKE: Persistent Disk → attaches/detaches to node

AKS: Azure Disk → attached/detached as PV

5. Best Practices for Multi-Pod Deployments

hostPath → Only for single Pod / single-node testing

EBS / PD / Azure Disk → Single Pod per volume (RWO)

RWX storage (NFS, EFS, CephFS) → Multi-Pod / multi-node sharing

For databases:

Single instance → EBS / PD works

StatefulSet with multi-replicas → RWX storage required

6. Summary

hostPath: Quick demo, node-specific, no PV/PVC needed, not multi-pod

PV + PVC:

Static → PV created manually, PVC binds → good for local labs

Dynamic → PVC triggers PV from StorageClass → cloud-friendly

Default StorageClass differs by vendor → determines where PVC-backed PV is stored

Access Modes decide multi-Pod usage: RWO = single Pod, RWX = multiple Pods

Vendor-specific defaults matter when teaching dynamic provisioning
