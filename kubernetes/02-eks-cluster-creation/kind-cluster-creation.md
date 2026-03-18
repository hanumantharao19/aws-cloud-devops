## Step 1: Install Chocolatey (if not installed)
- Open PowerShell as Administrator and run:

```
Set-ExecutionPolicy Bypass -Scope Process -Force; `
[System.Net.ServicePointManager]::SecurityProtocol = `
[System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```
## Step 2: Install Kind
```
choco install kind -y
```
## Step 3: Verify
```
kind version
```
## step 4 Install kubectl ( if not installed)
```
choco install kubernetes-cli -y
```

## step 5 verify the kubectl installed or not
```
kubectl version --client
```
## step 6 create cluster with below command
```
kind create cluster --name my-cluster
```
## step 7 check the available nodes after creating the cluster
```
kubectl get nodes
```