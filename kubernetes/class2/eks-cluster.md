- step1) create ec2 instance with redhat opeation system
- step2) create role in aws and attach admin permision(attach aws managed adminstrator polaciy) to 
        that role
- step3) attach the roles to ec2 instance
- step4) install git in the server
```
sudo yum install git
```
- step5) install terraform in the server
```
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform
```
- step6) download the git repo for create EKS cluster
```
git clone https://github.com/hashicorp-education/learn-terraform-provision-eks-cluster
```
- step7) create the EKS cluster with commands
```
cd learn-terraform-provision-eks-cluster
terraform init
terraform plan
terraform apply
```
- step8) install kubectl in the ec2 server
```
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version
```
- step9) Install aws cli in the server
```
sudo dnf install python3-pip
pip3 install awscli --upgrade --user
aws --version
```
- step10)Install aws iam authenticator in Linux
```
curl -o aws-iam-authenticator https://s3.us-west-2.amazonaws.com/amazon-eks/1.21.2/2021-07-05/bin/linux/amd64/aws-iam-authenticator
chmod +x ./aws-iam-authenticator
sudo mv aws-iam-authenticator /usr/local/bin/
aws-iam-authenticator version

```
- step11) Connect the EKS cluster form ec2 instance
```
aws eks update-kubeconfig --region us-east-2 --name <clustername>
```