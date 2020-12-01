#!Usr/bin/sh zsh

#nettoyer tt pour actualiser:
#kuberctl delete --all {nom du service}

#if pas installe
	#installer kontrakt
	#driver=none

#if minikube est pas dj start:
	#start minikube
	#stop le nginx par defait de la vm
	#sudo chown (et on remplace $HOME/.kube par $HOME/.minikube)

#installer load balancer (metallb)
#creer secret
#apply metallb.yaml (ds srcs)
#IP = (IP du LB)
#echo "IP :" IP (on affiche l'IP du LB pr etre sur que ca s'est bien fait)

#docker build ./srcs/{norm du service}
#(pour chaque service)

#creer DB et user pr wordpress et host mysql

#creer un autre secret

#on creer les services:
#kuberctl create -f srcs/{nom du service}.yaml

#sudo minikube dashboard (ajouter '&' pour que ca run en background ->moins visuel)