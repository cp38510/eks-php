# Deploy EKS cluster with PHP application to AWS


## Run deploy container

If you have .aws config on localhost machine, run:
```bash
docker run -it -v /root/.aws/:/.aws cp38510/eks-php:ver1
```

If that your first setup in AWS, create account in https://console.aws.amazon.com/iam/home?#/security_credentials  
and run:  
```bash
docker run -it cp38510/eks-php:ver1
aws configure
```


## Deploy cluster and application

For deploy EKS cluster and PHP app, run:
```bash
bash scr_deploy.sh
```

## Remove application and EKS cluster

For delete application and EKS cluster, run:
```bash
bash scr_purge.sh
```
