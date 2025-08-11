# Kubernetes Overview

**Kubernetes** is a portable, extensible, open-source platform for managing containerized workloads and services.  
It supports **declarative configuration** and **automation**, making it a powerful tool for scaling and managing applications.

---

## Kubernetes Installation Methods

### 1. Single-Node Installation
For learning and testing purposes, you can install Kubernetes on a single node.

- **Minikube**  
  A single-node Kubernetes distribution officially released by the Kubernetes community. Ideal for local development.

- **k3s**  
  A lightweight Kubernetes distribution released by Rancher. Designed for resource-constrained environments and edge computing.

---

### 2. Manual Cluster Installation
- **kubeadm**  
  A tool to bootstrap Kubernetes clusters manually. Suitable for those who want full control over cluster setup.

---

### 3. Automatic Cluster Installation
This type of installation uses automation tools, scripts, or provider-distributed installers.

- **kops**  
  Kubernetes Operations tool that manages the cluster lifecycle and provisions the required cloud infrastructure.  
  Officially supports AWS.

---

### 4. Managed Kubernetes Services
These services are provided and maintained by cloud providers, reducing operational overhead.

- **EKS (Elastic Kubernetes Service)** – *AWS*  
  Managed Kubernetes service by Amazon. Easily integrates with other AWS services.  
  CLI Tool: `eksctl` – enables you to create a production-ready cluster in minutes.

- **GKE (Google Kubernetes Engine)** – *Google Cloud*  
  Google’s managed Kubernetes service. Offers **Autopilot mode** to optimize and automate cluster management.

- **AKS (Azure Kubernetes Service)** – *Microsoft Azure*  
  Managed Kubernetes service by Azure. Easily integrates with the Azure ecosystem.

---
