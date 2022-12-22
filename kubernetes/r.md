kubectl create ns desarrollo

kubectl get ns -A

kubectl apply -f mysql-pod-var.yaml -n desarrollo

kubectl get pod -n desarrollo

kubectl exec -it mysql-pod -n desarrollo -- sh

kubectl exec -it mysql-pod -n desarrollo -- mysql -u root -p

pass:secret