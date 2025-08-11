## install the ingress-controller in EKS cluster
# step1 
- connect the eks cluster form local or vm

## step2
```
kubectl create namespace ingress-nginx
```
## step3
```
$ helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
$ helm repo update
```

## step4
```
$ helm install ingress-nginx ingress-nginx/ingress-nginx \
  --namespace ingress-nginx --create-namespace \
  --set controller.publishService.enabled=true \
  --set-string controller.extraArgs.update-status="false"
```