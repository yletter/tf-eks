```


aws eks update-kubeconfig --region us-east-1 --name release-cluster

kubectl delete service usermgmt-webapp-nlb-service
kubectl delete deployment usermgmt-webapp
kubectl delete service mysql
kubectl delete deployment mysql
kubectl delete configmap usermanagement-dbcreation-script
kubectl delete pvc ebs-mysql-pv-claim
kubectl delete sc ebs-sc

aws eks update-kubeconfig --region us-east-1 --name release-cluster

kubectl apply -f 01-storage-class.yaml
kubectl apply -f 02-persistent-volume-claim.yaml
kubectl apply -f 03-UserManagement-ConfigMap.yaml
kubectl apply -f 04-mysql-deployment.yaml
kubectl apply -f 05-mysql-clusterip-service.yaml
kubectl apply -f 06-UserMgmtWebApp-Deployment.yaml
kubectl apply -f 08-UserMgmtWebApp-Network-LoadBalancer.yaml

kubectl edit pvc ebs-mysql-pv-claim
4Gi to 6 Gi

```
