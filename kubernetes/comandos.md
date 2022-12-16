  ```
  27 kubectl get nodes -A
  30 kubectl get po -A
  31 kubectl apply -f .\nginx-pod.yaml
  32 kubectl get po
  33 kubectl describe po nginx-pod
  34 kubectl get po
  35 kubectl exec -it nginx-pod sh
  40 kubectl logs nginx-pod
  41 kubectl port-forward po/nginx-pod 8888:80
  43 kubectl get po --show-labels
  44 kubectl get po -l app=nginx
  45 kubectl get po -Lapp
  46 kubectl get po -Lapp -Lenv
  47 nano nginx-rs.yaml
  48 kubectl apply -f .\nginx-rs.yaml
  49 kubectl get po,rs
  57 kubectl get pod -o wide
  62 nano nginx-deploy.yaml
  63 kubectl apply -f .\nginx-deploy.yaml
  64 kubectl get deploy
  65 kubectl get po,rs,deploy
  66 kubectl rollout history deploy/deployment-nginx
  67 kubectl describe deploy deployment-nginx
  68 kubectl set image deploy/deployment-nginx nginx-image=nginx:alpine-slim
  69 kubectl rollout history deploy/deployment-nginx
  70 kubectl get po,rs,deploy
  71 kubectl rollout undo deploy/deployment-nginx
  72 kubectl rollout history deploy/deployment-nginx
  73 nano node-app-deploy.yaml
  74 kubectl apply -f .\node-app-deploy.yaml
  75 kubectl get po,rs,deploy
  80 kubectl logs node-app-deploy-68bdbf99cd-2ncvv
  81 kubectl port-forward deploy/node-app-deploy 8888:3000
  ```