FROM ubuntu:18.04

RUN apt update && \
    apt -y install wget unzip curl git

RUN wget https://releases.hashicorp.com/terraform/0.12.25/terraform_0.12.25_linux_amd64.zip && \
    unzip terraform_0.12.25_linux_amd64.zip && \
    mv ./terraform /usr/local/bin/terraform

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    sudo ./aws/install


RUN curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.8/2020-04-16/bin/linux/amd64/aws-iam-authenticator && \
    chmod +x ./aws-iam-authenticator && \
    mv ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator


RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    sudo mv ./kubectl /usr/local/bin/kubectl


RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 && \
    chmod 700 get_helm.sh && \
    bash ./get_helm.sh


RUN  apt-get clean

RUN git clone https://github.com/cp38510/eks-php.git

WORKDIR /eks-php

ENTRYPOINT ["/bin/bash"]
