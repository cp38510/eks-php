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


until $(curl -s --fail $DOMAIN |grep HOSTNAME |grep -c "php-" > /dev/null); do
    echo "Service starting..."
    sleep 5s
done


echo -e "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo -e "Deploying PHP service to EKS done!\nCheck domain: $DOMAIN"
echo -e "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

