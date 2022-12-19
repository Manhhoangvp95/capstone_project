#!/usr/bin/env bash

# Integrate kubectl with aws eks
aws eks update-kubeconfig --region us-east-1 --name ${cluster_name}

export KUBECONFIG=~/.kube/config
# Set variable to config file
cat flask_deployment.yaml | envsubst '${CIRCLE_SHA1}' > flask_config_deployment.yaml
# Deploy
kubectl apply -f flask_config_deployment.yaml

# this wait for 'Available=True' only works for initial deployment, not rolling
kubectl wait deployment myflaskapp-deployment --for condition=Available=True --timeout=90s