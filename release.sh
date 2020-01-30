#!/bin/bash
TAG=$1
echo "start tiller"
export KUBECONFIG=$HOME/.kube/kubeconfig
helm tiller start-ci
export HELM_HOST=127.0.0.1:44134
result=$(eval helm ls | grep helmCharts) 
if [ $? -ne "0" ]; then 
   helm install --timeout 180 --name helmCharts --set image.tag=$TAG charts/helmCharts
else 
   helm upgrade --timeout 180 helmCharts --set image.tag=$TAG charts/helmCharts
fi
echo "stop tiller"
helm tiller stop 
view raw
