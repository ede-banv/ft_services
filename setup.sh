#!/usr/bin/env zsh

function delete_services {
	if ! kubectl version 2>/dev/null 1>&2 ; then
		return
	fi
	echo "Cleaning services..."
	kubectl delete -f srcs/nginx.yaml
	kubectl delete -f srcs/ftps.yaml
	kubectl delete -f srcs/wordpress.yaml
	kubectl delete -f srcs/phpmyadmin.yaml
	kubectl delete -f srcs/mysql.yaml
	kubectl delete -f srcs/influxdb.yaml
	kubectl delete -f srcs/grafana.yaml
}

function minikube_start {
	if ! kubectl version 2>/dev/null 1>&2 ; then
		echo "Starting minikube..."
		minikube start --driver=docker
		./setup.sh
		exit
	fi
}

function install_metallb {
	echo "Installing MetalLB..."
	kubectl get configmap kube-proxy -n kube-system -o yaml | \
	sed -e "s/strictARP: false/strictARP: true/" | \
	kubectl diff -f - -n kube-system

	kubectl get configmap kube-proxy -n kube-system -o yaml | \
	sed -e "s/strictARP: false/strictARP: true/" | \
	kubectl apply -f - -n kube-system

	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml > /dev/null 2>&1 ;
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml > /dev/null 2>&1 ;
    kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" > /dev/null 2>&1
	kubectl apply -f ./srcs/metallb.yaml
	
}

function build_images {
	echo "Building images..."
	eval $(minikube docker-env)
	docker build ./srcs/nginx -t nginx_img
	docker build ./srcs/wordpress -t wordpress_img
	docker build ./srcs/phpmyadmin -t phpmyadmin_img
	docker build ./srcs/mysql -t mysql_img
	docker build ./srcs/influxdb -t influxdb_img
	docker build ./srcs/grafana -t grafana_img
	docker build ./srcs/ftps -t ftps_img
}

function create_services {
	echo "Applying yaml files and creating services..."
	kubectl create -f srcs/nginx.yaml
	kubectl create -f srcs/wordpress.yaml
	kubectl create -f srcs/phpmyadmin.yaml
	kubectl create -f srcs/mysql.yaml
	kubectl create -f srcs/influxdb.yaml
	kubectl create -f srcs/grafana.yaml
	kubectl create -f srcs/ftps.yaml
}

function dashboard_start {
	minikube dashboard &
}

bash prerequisites.sh
delete_services
minikube_start
install_metallb

DB_NAME=wordpress; DB_USER=ede-banv; DB_PASSWORD=cokinou; DB_HOST=mysql
IDB_NAME=grafana; IDB_USER=grandmaster; IDB_PASSWORD=42
kubectl create secret generic db-id \
	--from-literal=name=${DB_NAME} \
	--from-literal=user=${DB_USER} \
	--from-literal=password=${DB_PASSWORD} \
	--from-literal=host=${DB_HOST} \
	--from-literal=idb-name=${IDB_NAME} \
	--from-literal=idb-user=${IDB_USER} \
	--from-literal=idb-password=${IDB_PASSWORD} \

build_images
create_services
dashboard_start
IP=$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)
echo "IP :" $IP
