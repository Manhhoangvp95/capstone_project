#!/usr/bin/env bash

if aws eks list-clusters | grep -q "${cluster_name}"
then
  echo "cluster existed!"
else
	cat cluster.yml | envsubst '${cluster_name}' > cluster-config-create.yml
  eksctl create cluster --config-file=cluster-config-create.yaml
  sleep 15m 30s
fi