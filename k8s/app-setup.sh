#!/bin/bash

echo "connecting to GKE Cluster"
gcloud container clusters get-credentials devkube --zone europe-west2-b --project gcp-gke-dev-360209
sleep 2

echo "Installing Nginx Ingress controller via helm"
helm install sri-ingress ingress-nginx/ingress-nginx --namespace ingress --version 4.0.17 --values nginx-val.yaml --create-namespace

sleep 15

echo "Installing whereami app via helm"
helm install whereami whereami
sleep 15

echo "Installing CRDs for cert manager"
cd cert-manager; kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.9.1/cert-manager.crds.yaml

echo "Installing cert-manager via helm"
helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --version v1.9.1
sleep 15

echo "Installing cluster issuer and certificate"
cd cert-manager; kubectl apply -f .

echo "showing Ingress for public IP that needs to be assigned to domain"
kubectl get ingress


