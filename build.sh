#!/bin/bash
# A Script to tell you my favorite tree


#Start the minikube if not running
minikube start

#Switch to minikube to local repository
$(minikube docker-env:)

