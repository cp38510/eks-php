#!/bin/bash
DOMAIN="$(kubectl get svc |grep LoadBalancer |awk '{print $4}')"


aws eks list-clusters |grep -c php
if [ $? -ne 0 ]; then echo "ERROR, EKS cluster not exist, check: aws eks list-clusters" && exit 1; fi


while [ -z "$DOMAIN" ]
do
    echo "Domain creating..."
    sleep 5s
    DOMAIN="$(kubectl get svc |grep LoadBalancer |awk '{print $4}')"
#    echo $DOMAIN > /dev/null
done

POD_NAME="$(kubectl get pod |grep 'php-' |awk '{print $1}')"
RESULT="$(curl -s $DOMAIN |grep HOSTNAME | grep -c $POD_NAME)"
while [ "$RESULT" -ne 3 ]
do
    echo "Service starting..."
    sleep 5s
    curl -s $DOMAIN |grep HOSTNAME | grep -c $POD_NAME > /dev/null
    if [ $? -eq 0 ]; then break; fi
 #   echo $RESULT > /dev/null
 #   echo $DOMAIN > /dev/null
 #   echo $POD_NAME > /dev/null
 #   DOMAIN="$(kubectl get svc |grep LoadBalancer |awk '{print $4}')"
done



echo -e "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo -e "Deploying PHP service to EKS done!\nCheck domain: $DOMAIN"
echo -e "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
