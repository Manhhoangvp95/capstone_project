#!/usr/bin/env bash

aws eks update-kubeconfig --region us-east-1 --name ${cluster_name}

export KUBECONFIG=~/.kube/config

kubectl get nodes

kubectl apply -f flask_deployment.yaml