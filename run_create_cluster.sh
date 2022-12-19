#!/usr/bin/env bash

if aws eks list-clusters | grep -q "${cluster-name}"
then
  echo "cluster existed!"
else
  eksctl create cluster --config-file=cluster.yaml
  sleep 15m 30s
fi