#!/usr/bin/env bash

aws eks describe-cluster --name test-cluster

eksctl create cluster --config-file=cluster.yaml

kubectl apply -f flask_deployment.yaml