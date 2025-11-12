```
Commands create,get ,descirbe and delete the deployment
kubectl create -f deployment.yaml
Kubectl get deployments
kubectl get all
kubectl describe deployment
kubect delete -f deployment.yaml
kubectl delete deployment
update the deployment with new image version
kubectl set image deployment.v1.apps/nginx-deployment mhr-container=nginx:1.16.1
or
kubectl set image deployment/nginx-deployment mhr-container=nginx:1.16.1
or
kubectl edit deployment/nginx-deployment
kubectl apply -f deployment.yaml
To know the status and history of the deployment
kubectl rollout status deployment/nginx-deployment # To know the status of deployment
kubectl rollout history deployment/nginx-deployment # To know the rollout history
kubectl rollout history deployment/nginx-deployment --revision=3 # To know the image version details for the particular revsion
Roll back to the previous of the deployment
kubectl rollout undo deployment/nginx-deployment # Roll back to the previous version of the deployment
kubectl rollout undo deployment/nginx-deployment --to-revision=2 # Roll back back to the required version of deployment(example version 2)
Scale in and scale oot replicas
kubectl scale deployment/nginx-deployment --replicas=2
kubectl scale deployment/nginx-deployment --replicas=5
Deployement in command line
kubectl create deployment hello-node --image=k8s.gcr.io/echoserver:1.4
kubectl expose deployment hello-node --type=NodePort --port=8080
Reference doc: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/
Namespace:
name space is noting but a virtual cluster
namespace is used to isolate the reosuces or application in the k8 cluster
Genrall a cluster can divided into number of namespaces as per our requirement
by default we have some namespaces in the cluster
kubectl get namespaces --> to list the namespaces or
kubectl get ns ---> --> to list the namespaces

```