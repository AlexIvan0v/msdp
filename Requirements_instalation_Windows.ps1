
#section will contain instalation for prereqired software helm cli for clouds, etc. 
#Install the package manager for Windows chocolately
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#install kubectl for cluster communication 
choco install kubernetes-cli -y
#Install helm for chart operating
choco install kubernetes-helm -y

#install az for communication with Azure 
Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; rm .\AzureCLI.msi
Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force