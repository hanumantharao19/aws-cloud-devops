# 1. Infrastructure Before IaC

Before Infrastructure as Code (IaC) tools existed, infrastructure setup
was manual and time-consuming:

-   **Manual Configuration:** System admins had to log in and configure
    each server one by one, often leading to errors and inconsistencies.
-   **No Version Control:** Infra changes weren't tracked, unlike code.
    If something broke, it was hard to roll back.
-   **Heavy Documentation:** Teams relied on documents/Word files, which
    became outdated quickly.
-   **Limited Automation:** At best, shell scripts were used, but they
    lacked flexibility.
-   **Slow Provisioning:** Spinning up servers or environments could
    take days or weeks.

👉 **Problem:** Manual processes were slow, error-prone, and not
scalable for modern cloud-native applications.

------------------------------------------------------------------------

# 2. What is IaC (Infrastructure as Code)?

-   **Definition:** IaC is the practice of managing infrastructure
    through code instead of manual processes.

**How it helps:** - ✅ Automated & repeatable deployments\
- ✅ Version-controlled infra (just like application code)\
- ✅ Faster & consistent provisioning\
- ✅ Easier rollback and auditing\
- ✅ Enables CI/CD and DevOps practices

**Popular IaC Tools:** Terraform, AWS CloudFormation, Azure ARM, Pulumi,
Ansible.

------------------------------------------------------------------------

# 3. Why Terraform? (Compared to Others)

Terraform is one of the most widely adopted IaC tools because of:

### Multi-Cloud Support:

-   Works with AWS, Azure, GCP, VMware, Kubernetes, On-Prem etc.\
-   Same codebase can provision resources across multiple providers.

### Declarative Syntax:

-   Define *what you want* (desired state) instead of *how to do it*.

### State Management:

-   Maintains a **state file** to track infra resources.\
-   Knows what changed between your code and real infra.

### Plan & Apply Workflow:

-   `terraform plan` → preview changes before applying.\
-   `terraform apply` → apply with confidence.

### Large Ecosystem:

-   Thousands of **providers** and **community modules**.\
-   Saves time by reusing prebuilt modules.

### Integration with DevOps Tools:

-   Works well with **Jenkins, GitHub Actions, Kubernetes, Ansible,
    Docker**.

### HCL (HashiCorp Configuration Language):

-   Human-readable & simple, designed for infra.

------------------------------------------------------------------------

# 4. Where Terraform Fits in DevOps?

Terraform sits in the **Provisioning Layer** of DevOps:

-   **CI/CD:** Jenkins/GitHub Actions → trigger Terraform → deploy
    infra\
-   **Containers:** Provision Kubernetes clusters and workloads\
-   **Monitoring & Scaling:** Combine with Prometheus/Grafana/Auto
    Scaling\
-   **Multi-cloud & Hybrid Cloud Management**
