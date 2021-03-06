#!/usr/bin/env bash

#service nginx stop
if ! minikube version | grep -i "v1.17.1" > /dev/null 2>&1 
then
    printf "\u21E9  Installing minikube v1.17.1... "
    curl -Lo minikube https://storage.googleapis.com/minikube/releases/v1.17.1/minikube-linux-amd64 > /dev/null 2>&1 ; \
    chmod +x minikube > /dev/null 2>&1 ; \
    sudo mkdir -p /usr/local/bin/ ; \
    sudo install minikube /usr/local/bin/
    rm minikube
else
    printf "\u2714  Minikube v1.17.1 is already installed.\n"
fi