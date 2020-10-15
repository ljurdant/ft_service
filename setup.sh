#!/bin/bash

GREEN="\e[92m"
YELLOW="\e[93m"
WHITE="\e[97m"

echo -e $WHITE"Updating kubectl..."
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl &> /dev/null
chmod +x ./kubectl &> /dev/null
sudo mv ./kubectl /usr/local/bin/kubectl -p 'user42' &> /dev/null
echo -e $GREEN"Kubectl updated"

echo -e $WHITE"Updating minikube..."
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 &> /dev/null
chmod +x minikube &> /dev/null
sudo mv ./minikube /usr/local/bin/minikube &> /dev/null
sudo chown -R $USER /usr/local/bin/minikube; chmod -R u+wrx /usr/local/bin/minikube
sudo apt-get install -y conntrack &> /dev/null
sudo chown -R $USER $HOME/.minikube; chmod -R u+wrx $HOME/.minikube &> /dev/null
echo -e $GREEN"Minikube updated"

#echo -e $WHITE"Setting docker user..."
#touch ~/.vm_setup
#sudo usermod -aG docker user42 && newgrp docker
#echo -e $GREEN"Docker user set"

echo -e $WHITE"Starting minikube..."
minikube delete &> /dev/null
minikube start --driver=docker &> /dev/null
echo -e $GREEN"Minikube started"

echo -e $WHITE
minikube addons enable metrics-server &> /dev/null
minikube addons enable dashboard &> /dev/null
minikube addons enable metallb &> /dev/null

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
docker build ./Wordpress --tag wordpress:latest
kubectl create -f Wordpress/wordpress.yaml
kubectl create -f Wordpress/wordpress-service.yaml
