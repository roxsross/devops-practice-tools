# se crea el configmap

kubectl apply -f mysql-cm-bd-v2.yaml -n desarrollo

kubectl get cm -n desarrollo

kubectl describe cm bd-demo -n desarrollo

# desplegar pod con ref de configmap

kubectl apply -f mysql-cm-podv2.yaml -n desarrollo

kubectl get pod -n desarrollo

kubectl describe mysql-demo-pod -n desarrollo

kubectl exec -it mysql-demo-pod -n desarrollo -- mysql -u root -p

