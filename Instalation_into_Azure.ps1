#Function for PATH modification

function Set-PathVariable {
    param (
        [string]$AddPath,
        [string]$RemovePath
    )
    $regexPaths = @()
    if ($PSBoundParameters.Keys -contains 'AddPath'){
        $regexPaths += [regex]::Escape($AddPath)
    }

    if ($PSBoundParameters.Keys -contains 'RemovePath'){
        $regexPaths += [regex]::Escape($RemovePath)
    }
    
    $arrPath = $env:Path -split ';'
    foreach ($path in $regexPaths) {
        $arrPath = $arrPath | Where-Object {$_ -notMatch "^$path\\?"}
    }
    $env:Path = ($arrPath + $addPath) -join ';'
}


#Section will contain necesary patch updates.
#Adding patchs 

$addPathKubectl=$env:HOMEDRIVE+$env:HOMEPATH+'\.azure-kubectl'
$addPathKubelogin=$env:HOMEDRIVE+$env:HOMEPATH+'\.azure-kubelogin'

Set-PathVariable -AddPath $addPathKubectl;
Set-PathVariable -AddPath $addPathKubelogin;

$AzureResourceGroupName='jenkins-ci-test-1'
$AzureClusterName='jenkins-ci-test-1'
$AzureKubernetesNameSpace='jenkins-ci-test-1'



#Infrastructure creation
#Azure login will prompt user for login into cloud env;
az logout
az login

#creating infrastructure I'll use the cheapest region 
az group create --name $AzureResourceGroupName --location eastus

#enabling monitoring recording to Azure recomendation  https://docs.microsoft.com/en-us/azure/aks/kubernetes-walkthrough
az provider register --namespace Microsoft.OperationsManagement
az provider register --namespace Microsoft.OperationalInsights

#creating AKS cluster 
az aks create --resource-group $AzureResourceGroupName --name $AzureClusterName --node-count 1 --enable-addons monitoring --generate-ssh-keys

#Inastalation of kubectl
az aks install-cli

#Configure kubectl to work with newle created cluster
az aks get-credentials --resource-group $AzureResourceGroupName --name $AzureClusterName --overwrite-existing




#installing jenkins into cluster

#create new name space for Jenkins
kubectl create namespace $AzureKubernetesNameSpace

#adding latest repository:

helm repo add jenkins https://charts.jenkins.io
helm repo update

#run instalation command
helm install jenkins-test jenkins/jenkins --namespace $AzureKubernetesNameSpace --set controller.ingress.enabled=true

#opens our pod to the internet
kubectl expose pod jenkins-test-0 --port=8080 --name=jenkins-out --type=LoadBalancer --namespace $AzureKubernetesNameSpace