sudo apt update
sudo apt install snapd
sudo apt-get install python3 -y
sudo snap install helm --classic
sudo snap install kubectl --classic


#Azure cli instalation
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
az --version

#Install AWS cli and eksctl

curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl version
sudo apt  install awscli 

#installing gcloud 
sudo snap install google-cloud-sdk --classic