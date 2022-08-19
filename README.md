# GCP-GKE

### Requirements:

On your local machine make sure below components are present:
1.	Python3
2.	Git
3.	Terraform
4.	Google-cloud-sdk (to connect to GKE from local)
5.	Helm
6.	Kubectl

### Installation/Setup :

1.	Go to GCP and create you project and have your project id key
 
2.	Create a bucket in the storage service of GCP to have the terraform state synced and get the bucket name

3.	Clone code repo from https://github.com/rlingala-RP/GCP-GKE.git
4.	``` cd terraform ```
5.	In the variables.tf file change the bucket name and project id that you have created
6.	``` terraform plan ``` -> you can see in the output what resource are going to be created
7.	``` terraform apply -auto-approve ``` -> this will create the infrastructure on GCP
8.	``` cd ../k8s ```
9.	``` gcloud container clusters get-credentials dev --region europe-west2-b ``` -> this will help you connect to the GKE cluster that is just created
10.	``` helm install sri-ing ingress-nginx/ingress-nginx --namespace ingress --version 4.0.17 --values nginx-val.yaml --create-namespace ``` -> this will install nginx ingress controller in GKE
11.	``` helm install whereami whereami ``` -> this will install whereami chart (our application)
12.	``` cd cert-manager ```
13.	``` helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --version v1.9.1 ```
14.	``` kubectl apply -f cert-issuer-ingress.yaml ``` -> this will create a certificate issuer - here it is Letsencrypt
15.	``` kubectl apply -f certificate.yaml ``` -> this will generate the certificate.
