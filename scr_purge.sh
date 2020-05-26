#!/bin/bash

#Delete k8s app
helm delete eks-php

#Wait remove resources
sleep 30s

#Delete service
terraform destroy -auto-approve terraform-provision-eks-cluster
