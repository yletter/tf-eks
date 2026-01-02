* Commands:
```

kubectl apply -f ingress-app1.yaml
kubectl apply -f ingress-app2.yaml
kubectl apply -f ingress-app3.yaml
kubectl apply -f ingress2.yaml

kubectl delete -f ingress2.yaml
kubectl delete -f ingress-app1.yaml
kubectl delete -f ingress-app2.yaml
kubectl delete -f ingress-app3.yaml

kubectl apply -f deployment.yaml
kubectl apply -f ingress.yaml

kubectl delete -f ingress.yaml
kubectl delete -f deployment.yaml

kubectl apply -f ingress-app1.yaml
kubectl apply -f ingress-app2.yaml
kubectl apply -f ingress-app3.yaml
kubectl apply -f ingress3.yaml

kubectl delete -f ingress3.yaml
kubectl delete -f ingress-app1.yaml
kubectl delete -f ingress-app2.yaml
kubectl delete -f ingress-app3.yaml

```