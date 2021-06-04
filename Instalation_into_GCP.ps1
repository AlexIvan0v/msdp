
$GCPProjectID='jenkins-into-gke2'
$GCPProjectName='Jenkins-ci'
$GCPclusterName='regional-cluster-1'
$GCPKubernetesNameSpace='jenkins-ci-test'

#Asumption all nececary software installed. 

#GCP clean login information 
gcloud auth revoke --all
#Login into GCP
gcloud auth login
#Set project by ID
gcloud config set project $GCPProjectID

#Create autopilot cluster in us zones 
#UPDATE unfortunalety auto is not the good choice.
#gcloud container clusters create-auto $GCPclusterName --project $GCPProjectID --region "us-central1"

#Create zonal cluster in us zones
gcloud container clusters create  $GCPclusterName --project $GCPProjectID --region "us-central1" --num-nodes 1

#Get connection info for cluster
gcloud container clusters get-credentials $GCPclusterName --region us-central1 --project $GCPProjectID



#installing jenkins into cluster

#create new name space for Jenkins
kubectl create namespace $GCPKubernetesNameSpace

#adding latest repository:

helm repo add jenkins https://charts.jenkins.io
helm repo update

#run instalation command
helm install jenkins-test jenkins/jenkins --namespace $GCPKubernetesNameSpace
