#!/bin/bash
# A Script to tell you my favorite tree


#Start the minikube if not running
minikube start

#Switch to minikube to local repository
eval $(minikube docker-env) 

#get the file from the repository
mkdir forest
cd forest
mkdir trees
cd trees
wget https://raw.githubusercontent.com/ochuko3d/forest/master/requirements.txt
wget https://raw.githubusercontent.com/ochuko3d/forest/master/tree.py
wget https://raw.githubusercontent.com/ochuko3d/forest/master/Dockerfile
wget https://raw.githubusercontent.com/ochuko3d/forest/master/test_tree.py

#run the build 
docker build . -t ecosia/apple

#pull the deployment files
sudo wget https://raw.githubusercontent.com/ochuko3d/forest/master/Deployment.yaml
sudo wget https://raw.githubusercontent.com/ochuko3d/forest/master/Ingress.yaml

#launch the deployment and ingress
kubectl create -f Deployment.yaml
kubectl create -f Ingress.yaml
#Enable Minikube Service for forest
minikube service forest-service
#Enable Minikube Nginx Ingress
minikube addons enable ingress

# Add to host file
echo "$(minikube ip) local.ecosia.org" | sudo tee -a /etc/hosts
