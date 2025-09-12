# Kubernetes Architecture

Kubernetes follows a **master-worker architecture**. It is designed to manage containerized applications across a cluster of machines efficiently.

---

## 📌 Key Components

### 1. API Server
- Acts as the **front end** for Kubernetes.  
- Works as the **gatekeeper** of the Kubernetes cluster.  
- `kubectl` and other clients interact with the cluster through the API server.  
- Validates and configures API objects like **Pods, Services, Deployments, and ReplicaSets**.  
- Responsible for exposing the various APIs used by Kubernetes.

---

### 2. Etcd
- A **distributed, reliable key-value store**.  
- Used by Kubernetes to **store all cluster data**, including:  
  - Cluster state  
  - Configuration details  
  - Workload statuses  
- Acts as the **single source of truth** for the cluster.

---

### 3. Scheduler
- Responsible for **distributing Pods across worker nodes**.  
- Watches for newly created Pods without an assigned node.  
- Assigns Pods to nodes based on:  
  - Resource requirements  
  - Affinity & anti-affinity rules  
  - Hardware/software/policy constraints  
  - Data locality & deadlines  
  - Quality of service requirements  

---

### 4. Controllers
- The **brains of Kubernetes orchestration**.  
- Continuously monitor the cluster state and take corrective actions.  
- Examples of controllers:  
  1. **Replication Controller** – Ensures the desired number of pod replicas are running.  
  2. **Endpoints Controller** – Populates the Endpoints object (used for service discovery).  
  3. **Namespace Controller** – Manages namespaces and cleanup.  
  4. **Service Accounts Controller** – Manages service accounts and API tokens.  

---

### 5. Kube-Proxy
- A **network proxy** that runs on each worker node.  
- Maintains network rules for communication within and outside the cluster.  
- Routes traffic to the correct Pods based on:  
  - Pod IP  
  - Service IP  
  - Port number  

---

### 6. Container Runtime
- The **underlying software** that runs containers.  
- Kubernetes relies on a container runtime to execute containers.  
- Examples:  
  - Docker  
  - containerd  
  - CRI-O  
  - rkt (legacy)  

---

## 📌 Summary
- **API Server** – Entry point & gatekeeper.  
- **Etcd** – Stores cluster state.  
- **Scheduler** – Assigns pods to nodes.  
- **Controllers** – Ensure desired cluster state.  
- **Kube-Proxy** – Handles networking.  
- **Container Runtime** – Runs the containers.  

Together, these components make Kubernetes a **powerful orchestration platform** for running containerized workloads.


