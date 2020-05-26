# Deploy EKS cluster with PHP application to AWS


## Prepare for deploy, run deploy container

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


## Change EKS cluster
For deploy EKS cluster use terraform.  
If you want change some variables, look files in directory terraform-provision-eks-cluster


## Change service helm chart 
For deploy application use helm.  
If you want change some variables, look files in directory php-app-chart.  
For update chart after install cluster you can use:
```bash
helm upgrade eks-php ./php-app-chart
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
