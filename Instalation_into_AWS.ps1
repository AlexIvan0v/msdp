#before use this script you should perfom aws config

eksctl create cluster --version=1.19 --name=jenkins-cluster --node-private-networking --alb-ingress-access --region=us-west-2 --asg-access --without-nodegroup

eksctl create nodegroup --cluster=jenkins-cluster --region=us-west-2 --name=jenkins-server-ng --managed --nodes=2 --node-labels="lifecycle=OnDemand,intent=jenkins-server"

$AWSKubernetesNameSpace='jenkins-ci-test'

#installing jenkins into cluster

#create new name space for Jenkins
kubectl create namespace $AWSKubernetesNameSpace

#adding latest repository:

helm repo add jenkins https://charts.jenkins.io
helm repo update

#run instalation command
helm install jenkins-test jenkins/jenkins --namespace $AWSKubernetesNameSpace


#kubectl exec --namespace $AzureKubernetesNameSpace -it svc/jenkins-test -c jenkins -- /bin/cat /run/secrets/chart-admin-password