#!/bin/sh

if [ ! -f ./manifest.yaml ]; then
  echo "Missing ./secrets.yaml"
  exit 1
fi

kubectl apply -f manifest.yaml

if [ -f ./secrets.yaml ]; then
  kubectl apply -f secrets.yaml
  kubectl rollout restart deployment auth-server crud-server
else 
  echo "Missing secrets.yaml. Not overwriting default secrets."
fi

kubectl get pods
