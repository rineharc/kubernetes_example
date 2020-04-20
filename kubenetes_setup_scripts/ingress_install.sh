#need to install helm first
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm repo update    

helm install my-nginx stable/nginx-ingress