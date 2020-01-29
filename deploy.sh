docker build -t roohhiit110393/rails_k8s:latest -t roohhiit110393/rails_k8s:$SHA 

docker push roohhiit110393/rails_k8s:latest

docker push roohhiit110393/rails_k8s:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=roohhiit110393/rails_k8s:$SHA