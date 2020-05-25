#!/bin/bash
DOMAIN="$(kubectl get svc |grep LoadBalancer |awk '{print $4}')"
RESULT="0"


while [ -z "$DOMAIN" ]
do
    echo "Domain creating..."
    sleep 5s
    DOMAIN="$(kubectl get svc |grep LoadBalancer |awk '{print $4}')"
done

RESULT="$(curl -s $DOMAIN |grep HOSTNAME |grep -c "php-*")"
while [ "$RESULT" -eq 0 ]
do
    echo "Service starting..."
    sleep 5s
    RESULT="$(curl -s $DOMAIN |grep HOSTNAME |grep -c "php-*")"
done

echo "Deploying PHP service to EKS done, check domain: $DOMAIN"
