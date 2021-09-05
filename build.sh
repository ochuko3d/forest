#!/bin/bash
# A Script to tell you my favorite tree.
#Start the minikube if not running
minikube start
#This makes the directory and various sub directories for the application and the deployment files, get the files from the repository
mkdir ecosia
cd ecosia
mkdir trees
cd trees
#This will pull dwn the files from the repositories

#The requirements needed to be install
sudo wget https://raw.githubusercontent.com/ochuko3d/forest/master/requirements.txt
#The main application file
sudo wget https://raw.githubusercontent.com/ochuko3d/forest/master/tree.py
#The dockerfile needed for the build
sudo wget https://raw.githubusercontent.com/ochuko3d/forest/master/Dockerfile
#The python test that works with pytest
sudo wget https://raw.githubusercontent.com/ochuko3d/forest/master/test_tree.py

#This line Switches to minikube to local repository
eval $(minikube docker-env) 

#This line runs the build 
docker build . -t ecosia/apple

#This line Switches to minikube to local repository, I did this again just to be extra safe
eval $(minikube docker-env) 

cd ..

#This makes the subdirectory for the deployment files
mkdir deployment
cd deployment
#This line pulls the deployment files
sudo wget https://raw.githubusercontent.com/ochuko3d/forest/master/Deployment.yaml
sudo wget https://raw.githubusercontent.com/ochuko3d/forest/master/Ingress.yaml

#This line launches the deployment(consisting of the the deployment and service) and ingress
kubectl create -f Deployment.yaml
kubectl create -f Ingress.yaml

#Enable Minikube Service for forest
minikube service forest-service
#This line Enables Minikube Nginx Ingress
minikube addons enable ingress

# This line Adds the url to host file
echo "$(minikube ip) local.ecosia.org" | sudo tee -a /etc/hosts
