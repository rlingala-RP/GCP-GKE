# GCP-GKE

### Requirements:

On your local machine make sure below components are present:
1.	Python3
2.	Git
3.	Terraform
4.	Google-cloud-sdk (to connect to GKE from local)
5.	Helm
6.	Kubectl
7. Go

### Setup Infrastructure

1.	Go to GCP and create a project and have that project id key
 
2.	Create a bucket in the storage service of GCP to have the terraform state synced and get the bucket name

3.	Clone code repo from https://github.com/rlingala-RP/GCP-GKE.git
4.	``` cd terraform ```
5.	In the variables.tf file replace the project id with your project id and in the provider.tf file replace the bucket name with the one you created
6.	``` terraform init ``` -> will initalize the gcs backend to update the state of the terraform 
7.	``` terraform plan ``` -> you can see in the output what resource are going to be created
8.	``` terraform apply -auto-approve ``` -> this will create the infrastructure on GCP

### Hosting whereami application on GKE - Manual steps
1. Inside repo
10.	``` cd ../k8s ```
11.	``` gcloud container clusters get-credentials dev-kube --zone europe-west2-b --project gcp-gke-dev-360209``` -> this will help you connect to the GKE cluster that is just created
12.	``` helm install sri-ingress ingress-nginx/ingress-nginx --namespace ingress --version 4.0.17 --values nginx-val.yaml --create-namespace ``` -> this will install nginx ingress controller in GKE
13.	``` helm install whereami whereami ``` -> this will install whereami chart (our application)
14.	``` cd cert-manager ```
15. ``` kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.9.1/cert-manager.crds.yaml ``` -> CDRs installation for cert-manager
16.	``` helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --version v1.9.1 ``` -> install certmanager
17.	``` kubectl apply -f cluster-issuer.yaml ``` -> this will create a certificate issuer - here it is Letsencrypt 
18.	``` kubectl apply -f certificate.yaml ``` -> this will generate the certificate.
19. ``` kubectl get ingress ``` -> you will see an ip in this output, make sure that ip is setup as A record for the domain(sri.whereaminow.uk).
20. After few minutes go to browser and visit https://sri.whereaminow.uk/ -> you should now see the application running.

### Hosting whereami application on GKE with script (automated)

1. Inside repo
2. ``` sh k8s/app-setup.sh ``` -> This will setup whereami app on GKE 
3. From the last line of the above script output see the ip address and setit up as A record for the domain(sri.whereaminow.uk)
4. After few minutes go to browser and visit https://sri.whereaminow.uk/ -> you should now see the application running.

### Testing Infrastructure

1. Inside the repository go to test folder
2. ``` cd test ```
3. ``` go test -v -timeout 20m ``` -> this will run the unit test for the infrastructure

