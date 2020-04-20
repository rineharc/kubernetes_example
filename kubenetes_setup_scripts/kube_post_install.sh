#test app
kubectl create deployment test --image=crinehart/nginx:base

#expose it
kubectl expose deployment test --type=NodePort
