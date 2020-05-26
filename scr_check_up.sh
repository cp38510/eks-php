#!/bin/bash
DOMAIN="$(kubectl get svc |grep LoadBalancer |awk '{print $4}')"

aws eks list-clusters |grep -c php
if [ $? -ne 0 ]; then echo "ERROR, EKS cluster not exist, check: aws eks list-clusters" && exit 1; fi


while [ -z "$DOMAIN" ]
do
    echo "Domain creating..."
    sleep 5s
    DOMAIN="$(kubectl get svc |grep LoadBalancer |awk '{print $4}')"
done


while [ "$(curl -s $DOMAIN |grep HOSTNAME |grep -c "php-")" -eq 0 ]
do
    echo "Service starting..."
    sleep 5s
done

echo "Deploying PHP service to EKS done, check domain: $DOMAIN"
