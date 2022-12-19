#!/usr/bin/env bash

if aws eks list-clusters | grep -q "${cluster_name}"
then
  echo "cluster existed!"
else
	cat cluster.yaml | envsubst '${cluster_name}' > cluster-config-create.yaml
  eksctl create cluster --config-file=cluster-config-create.yaml
  sleep 15m 30s
fi