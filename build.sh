#!/bin/bash
# A Script to tell you my favorite tree


#Start the minikube if not running
minikube start

#Switch to minikube to local repository
eval $(minikube docker-env) 

#get the file from the repository
mkdir forest
cd forest
wget https://raw.githubusercontent.com/ochuko3d/forest/master/requirements.txt
wget https://raw.githubusercontent.com/ochuko3d/forest/master/tree.py
wget https://raw.githubusercontent.com/ochuko3d/forest/master/Dockerfile

#run the build 
docker build . -t ecosia/apple

cd ..
mkdir deploy
cd deploy

wget https://raw.githubusercontent.com/ochuko3d/forest/master/Deployment.yaml
wget https://raw.githubusercontent.com/ochuko3d/forest/master/Ingress.yaml

#Enable Minikube Service for forest
minikube service forest-service
#Enable Minikube Nginx Ingress
minikube addons enable ingress
