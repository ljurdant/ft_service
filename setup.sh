                             
minikube delete

minikube start --memory=2200MB --driver=docker
minikube addons enable metrics-server
minikube addons enable dashboard
minikube addons enable metallb
eval $(minikube docker-env)
kubectl delete configmap config -n metallb-system

docker build ./wordpress/Docker --tag=wordpress:latest
docker build ./nginx/Docker --tag=nginx:latest
docker build ./mysql/Docker --tag=mysql:latest
docker build ./phpmyadmin/Docker --tag=phpmyadmin:latest
docker build ./ftps/Docker --tag=ftps:latest
docker build ./influxdb/Docker --tag=influxdb:latest
docker build ./grafana/Docker --tag=grafana:latest

kubectl apply -f metallb/metallb.yaml
kubectl apply -f nginx/nginx-deployment.yaml
kubectl apply -f nginx/nginx-service.yaml
kubectl apply -f mysql/mysql-secret.yaml
kubectl apply -f mysql/mysql-pvc.yaml
kubectl apply -f mysql/mysql-deployment.yaml
kubectl apply -f mysql/mysql-service.yaml
kubectl apply -f wordpress/wordpress-deployment.yaml
kubectl apply -f wordpress/wordpress-service.yaml
kubectl apply -f phpmyadmin/phpmyadmin-deployment.yaml
kubectl apply -f phpmyadmin/phpmyadmin-service.yaml
kubectl apply -f ftps/ftps-deployment.yaml
kubectl apply -f ftps/ftps-service.yaml
kubectl apply -f influxdb/influxdb-volume.yaml
kubectl apply -f influxdb/influxdb-deployment.yaml
kubectl apply -f influxdb/influxdb-service.yaml
kubectl apply -f grafana/grafana-deployment.yaml
kubectl apply -f grafana/grafana-service.yaml
kubectl apply -f telegraf/telegraf-config.yaml
kubectl apply -f telegraf/telegraf-deployment.yaml
kubectl apply -f telegraf/telegraf-service.yaml
