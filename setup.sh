#!/usr/bin/env bash

function delete_services {
	if ! kubectl version 2>/dev/null 1>&2 ; then
		return
	fi
	echo "Cleaning services..."
	#nettoyer tt pour actualiser:
	#kubectl delete -f {nom du service}
	kubectl delete -f srcs/nginx.yaml
	kubectl delete -f srcs/ftps.yaml
	kubectl delete -f srcs/wordpress.yaml
	kubectl delete -f srcs/phpmyadmin.yaml
	kubectl delete -f /srcs/mysql.yaml
	#kubectl delete -f /srcs/influxdb.yaml
	#kubectl delete -f /srcs/grafana.yaml
}

function minikube_start {
	if ! kubectl version 2>/dev/null 1>&2 ; then
		echo "Starting minikube..."
		minikube start --driver=docker #(reinstaller minikube)
		#service nginx stop
	fi
}

function install_metallb {
	echo "Installing MetalLB..."
	# see what changes would be made, returns nonzero returncode if different
	kubectl get configmap kube-proxy -n kube-system -o yaml | \
	sed -e "s/strictARP: false/strictARP: true/" | \
	kubectl diff -f - -n kube-system

	# actually apply the changes, returns nonzero returncode on errors only
	kubectl get configmap kube-proxy -n kube-system -o yaml | \
	sed -e "s/strictARP: false/strictARP: true/" | \
	kubectl apply -f - -n kube-system
	#https://forhjy.medium.com/42-ft-service-how-to-install-kubernetes-metallb-30d66f92d726
	#installer load balancer (metallb)
	#kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.9.3/manifests/namespace.yaml
	#kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.9.3/manifests/metallb.yaml
	#creer secret
	#kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
	
	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml > /dev/null 2>&1 ;
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml > /dev/null 2>&1 ;
    kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" > /dev/null 2>&1
	#apply metallb.yaml (ds srcs)
	kubectl apply -f ./srcs/metallb.yaml
	
}

function build_images {
	echo "Building images..."
	eval $(minikube docker-env)
	#docker build ./srcs/{norm du service}
	docker build ./srcs/nginx -t nginx_img
	docker build ./srcs/wordpress -t wordpress_img
	docker build ./srcs/phpmyadmin -t phpmyadmin_img
	docker build ./srcs/mysql -t mysql_img
	#docker build ./srcs/influxdb -t influxdb_img
	#docker build ./srcs/grafana -t grafana_img
	docker build ./srcs/ftps -t ftps_img
}

#creer DB et user pr wordpress et host mysql (ou pas)

#creer un autre secret (ou pas) si variable env , sinon + simple

function create_services {
	echo "Applying yaml files and creating services..."
	#on cree les services:
	#kubectl create -f srcs/{nom du service}.yaml
	kubectl create -f srcs/nginx.yaml
	kubectl create -f srcs/wordpress.yaml
	kubectl create -f srcs/phpmyadmin.yaml
	kubectl create -f srcs/mysql.yaml
	#kubectl create -f srcs/influxdb.yaml
	#kubectl create -f srcs/grafana.yaml
	kubectl create -f srcs/ftps.yaml
}

function dashboard_start {
	minikube dashboard & #(ajouter '&' pour que ca run en background ->moins visuel)
}

bash prerequisites.sh
delete_services
minikube_start
install_metallb
build_images
create_services
dashboard_start
IP=$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)
echo "IP :" $IP #(on affiche l'IP du LB pr etre sur que ca s'est bien fait)