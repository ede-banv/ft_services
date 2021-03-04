#!Usr/bin/sh zsh

#nettoyer tt pour actualiser:
#kubectl delete --all {nom du service}
kubectl delete --all nginx
#kubectl delete --all wordpress
#kubectl delete --all phpmyadmin
#kubectl delete --all mysql
#kubectl delete --all influxdb
#kubectl delete --all grafana
kubectl delete --all ftps


if ! kubectl version 2>/dev/null 1>&2 ; then
	minikube start --driver=docker #(reinstaller minikube)
	sudo service nginx stop
fi

#https://forhjy.medium.com/42-ft-service-how-to-install-kubernetes-metallb-30d66f92d726
#installer load balancer (metallb)
kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.9.3/manifests/metallb.yaml
#creer secret
#apply metallb.yaml (ds srcs)
kubectl apply -f ./srcs/metallb.yaml
IP = minikube ip
echo "IP :" IP (on affiche l'IP du LB pr etre sur que ca s'est bien fait)

#docker build ./srcs/{norm du service}
docker build ./srcs/nginx -t nginx_img
#docker build ./srcs/wordpress -t wordpress_img
#docker build ./srcs/phpmyadmin -t phpmyadmin_img
#docker build ./srcs/mysql -t mysql_img
#docker build ./srcs/influxdb -t influxdb_img
#docker build ./srcs/grafana -t grafana_img
docker build ./srcs/ftps -t ftps_img

#creer DB et user pr wordpress et host mysql (ou pas)

#creer un autre secret (ou pas) si variable env , sinon + simple

#on creer les services:
#kubectl create -f srcs/{nom du service}.yaml
kubectl create -f srcs/nginx.yaml
#kubectl create -f srcs/wordpress.yaml
#kubectl create -f srcs/phpmyadmin.yaml
#kubectl create -f srcs/mysql.yaml
#kubectl create -f srcs/influxdb.yaml
#kubectl create -f srcs/grafana.yaml
kubectl create -f srcs/ftps.yaml

sudo minikube dashboard & #(ajouter '&' pour que ca run en background ->moins visuel)