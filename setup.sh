#!Usr/bin/sh zsh

#nettoyer tt pour actualiser:
#kuberctl delete --all {nom du service}
#kuberctl delete --all nginx
#kuberctl delete --all wordpress
#kuberctl delete --all phpmyadmin
#kuberctl delete --all mysql
#kuberctl delete --all influxdb
#kuberctl delete --all grafana
#kuberctl delete --all ftps


#if minikube est pas dj start:
	#minikube start --driver=docker
	#stop le nginx par defaut de la vm (ou pas)
	#sudo chown (et on remplace $HOME/.kube par $HOME/.minikube)

#installer load balancer (metallb)
#creer secret
#apply metallb.yaml (ds srcs)
#IP = (IP du LB)
#echo "IP :" IP (on affiche l'IP du LB pr etre sur que ca s'est bien fait)

#docker build ./srcs/{norm du service}
#docker build ./srcs/nginx
#docker build ./srcs/wordpress
#docker build ./srcs/phpmyadmin
#docker build ./srcs/mysql
#docker build ./srcs/influxdb
#docker build ./srcs/grafana
#docker build ./srcs/ftps

#creer DB et user pr wordpress et host mysql (ou pas)

#creer un autre secret (ou pas) si variable env , sinon + simple

#on creer les services:
#kubectl create -f srcs/{nom du service}.yaml

#sudo minikube dashboard (ajouter '&' pour que ca run en background ->moins visuel)