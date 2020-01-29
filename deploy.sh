# docker build -t roohhiit110393/rails_k8s:latest -t roohhiit110393/rails_k8s:$SHA 

# docker push roohhiit110393/rails_k8s:latest

# docker push roohhiit110393/rails_k8s:$SHA

kubectl apply -f k8s/k8s_rails-namespace.yaml
kubectl apply -f k8s/server-deployment.yaml
kubectl apply -f k8s/server-nodeport.yaml
kubectl apply -f k8s/k8s_rails-ingress.yaml
# kubectl set image deployments/server-deployment server=roohhiit110393/rails_k8s:$SHA