GREEN="\e[92m"
BLUE="\e[94m"
WHITE="\e[97m"

echo -en $WHITE
echo "Starting minikube..."                            
minikube delete &> /dev/null
minikube start --memory=2200MB --driver=docker &> /dev/null

echo "Configuring minikube..."
minikube addons enable metrics-server &> /dev/null
minikube addons enable dashboard &> /dev/null
minikube addons enable metallb &> /dev/null  
eval $(minikube docker-env) &> /dev/null
kubectl delete configmap config -n metallb-system &> /dev/null

echo "Building docker images..."
docker build ./wordpress/Docker --tag=wordpress:latest &> /dev/null
docker build ./nginx/Docker --tag=nginx:latest &> /dev/null
docker build ./mysql/Docker --tag=mysql:latest &> /dev/null
docker build ./phpmyadmin/Docker --tag=phpmyadmin:latest &> /dev/null
docker build ./ftps/Docker --tag=ftps:latest &> /dev/null
docker build ./influxdb/Docker --tag=influxdb:latest &> /dev/null
docker build ./grafana/Docker --tag=grafana:latest &> /dev/null
docker build ./telegraf/Docker --tag=telegraf:latest &> /dev/null

echo "Configuring metallb..."
kubectl apply -f metallb/metallb.yaml &> /dev/null

echo "Launching nginx service..."
kubectl apply -f nginx/nginx-deployment.yaml &> /dev/null
kubectl apply -f nginx/nginx-service.yaml &> /dev/null

echo "Launching mysql service..."
kubectl apply -f mysql/mysql-pvc.yaml &> /dev/null
kubectl apply -f mysql/mysql-deployment.yaml &> /dev/null
kubectl apply -f mysql/mysql-service.yaml &> /dev/null

echo "Launching wordpress service..."
kubectl apply -f wordpress/wordpress-deployment.yaml &> /dev/null
kubectl apply -f wordpress/wordpress-service.yaml &> /dev/null

echo "Launching phpmyadmin service..."
kubectl apply -f phpmyadmin/phpmyadmin-deployment.yaml &> /dev/null
kubectl apply -f phpmyadmin/phpmyadmin-service.yaml &> /dev/null

echo "Launching ftps service..."
kubectl apply -f ftps/ftps-deployment.yaml &> /dev/null
kubectl apply -f ftps/ftps-service.yaml &> /dev/null

echo "Launching influxdb service..."
kubectl apply -f influxdb/influxdb-volume.yaml &> /dev/null
kubectl apply -f influxdb/influxdb-deployment.yaml &> /dev/null
kubectl apply -f influxdb/influxdb-service.yaml &> /dev/null

echo "Launching grafana service..."
kubectl apply -f grafana/grafana-deployment.yaml &> /dev/null
kubectl apply -f grafana/grafana-service.yaml &> /dev/null
kubectl apply -f telegraf/telegraf-secret.yaml &> /dev/null
kubectl apply -f telegraf/telegraf-config.yaml &> /dev/null
kubectl apply -f telegraf/telegraf-deployment.yaml &> /dev/null
kubectl apply -f telegraf/telegraf-service.yaml &> /dev/null

echo -en $GREEN && echo "ft_services is ready!"
echo "Go to IP 192.168.49.240 to try it!"
echo -en $BLUE

echo "--------------------------------------------------------------------"
echo "| Service  |      Wordpress     | PhpMyadmin | Grafana | FTPS      |"
echo "|          | admin    | user1   |            |         |           |"
echo "|------------------------------------------------------------------|"
echo "| Login    | ljurdant | bobby   | ljurdant   | admin   | ljurdant  |"
echo "| Password | yo       | yo      | yo         | admin   | yo        |"
echo "--------------------------------------------------------------------"
echo "| Port     | 5050               | 5000       | 3000    | 21        |"
echo "--------------------------------------------------------------------"
