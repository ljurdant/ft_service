minikube delete

minikube start --memory=2200MB
minikube addons enable metrics-server
minikube addons enable dashboard
minikube addons enable metallb
kubectl delete configmap config -n metallb-system

docker build ./wordpress/Docker --tag=wordpress:latest
docker build ./nginx/Docker --tag=nginx:latest
docker build ./mysql/Docker --tag=mysql:latest
#docker build ./phpmyadmin/Docker --tag=phpmyadmin:latest

kubectl create -f metallb/metallb.yaml
kubectl create -f nginx/nginx-deployment.yaml
kubectl create -f nginx/nginx-service.yaml
kubectl create -f mysql/mysql-secret.yaml
kubectl create -f mysql/mysql-pvc.yaml
kubectl create -f mysql/mysql-deployment.yaml
kubectl create -f mysql/mysql-service.yaml
kubectl create -f wordpress/wordpress-deployment.yaml
kubectl create -f wordpress/wordpress-service.yaml
kubectl create -f wordpress/wordpress-pvc.yaml
kubectl create -f phpmyadmin/phpmyadmin-deployment.yaml
kubectl create -f phpmyadmin/phpmyadmin-service.yaml
