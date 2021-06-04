
#section will contain instalation for prereqired software helm cli for clouds, etc. 
#Install the package manager for Windows chocolately
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Install puthon3
choco install python3 -y

#install kubectl for cluster communication 
choco install kubernetes-cli -y
#Install helm for chart operating
choco install kubernetes-helm -y

#install az for communication with Azure 
choco install azure-cli -y

#Install aws cli and eksctl 
choco install awscli -y
choco install eksctl -y

#Install gcp sdk
choco install gcloudsdk -y

