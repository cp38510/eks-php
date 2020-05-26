#!/bin/bash

#Update files
git pull

#Init
terraform init terraform-provision-eks-cluster

#Install EKS cluster
terraform apply -auto-approve terraform-provision-eks-cluster

#Get ~/.kube/config
aws eks --region eu-central-1 update-kubeconfig --name $(aws eks list-clusters |grep php | cut -d'"' -f2)

#Check install
terraform apply -auto-approve terraform-provision-eks-cluster

#Install service
helm install eks-php ./php-app-chart

#Wait service start
bash scr_check_up.sh
