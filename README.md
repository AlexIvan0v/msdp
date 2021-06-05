# General
Repository for CI system installation into cloud providers. 
This repository created as free to use for every one.
Coding were done as part of master work into NauKMA. 

# How to use

This repository contains scripts files that allow you install Jenkins into Kubernetes cluster in cloud providers (AWS GCP Azure).
First of all you should register into cloud provider.
Then you should install necesary software on your PC. 
You could do it in two ways. Use scripts that provided in this repository. 
Or do it by your own using appropriate documentations and knoleage bases.
The software list is next:
- python3 https://www.python.org/download/releases/3.0/
- kubectl https://kubernetes.io/docs/tasks/tools/
- helm https://helm.sh/docs/intro/install/
- Azure CLI https://docs.microsoft.com/en-us/cli/azure/install-azure-cli 
- AWS eksctl https://docs.aws.amazon.com/eks/latest/userguide/eksctl.html 
- AWS CLI https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html
- GCP SDK https://cloud.google.com/sdk/docs/install

Next step is launching coresponding file scripts, depends on your system and cloud you want to use. 
For example You want use GCP and your system is Linux, so your choise is - Instalation_into_GCP.sh.
Download it replace variables in the top of file save and launch.

# Limitations: 
 - For AWS you should perform registration from your command line using *aws configure* command. 
 - For GCP you should create Project in console and enable Kubernetes Engine API for that project.