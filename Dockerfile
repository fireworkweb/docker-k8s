FROM alpine:3.11

ARG HELM_VERSION=3.1.2
ARG KUBECTL_VERSION=1.18.2
ARG AWS_IAM_AUTH_VERSION=0.5.0
ARG AWSCLI_VERSION=1.18.43
ARG DOCTL_VERSION=1.41.0

WORKDIR /tmp

RUN apk add --update --no-cache --virtual .build-deps \
    curl ca-certificates

# Install kubectl
RUN curl -L https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl

# Install helm
RUN curl -L https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz | tar xz && \
    mv linux-amd64/helm /usr/local/bin/helm && \
    chmod +x /usr/local/bin/helm

# Install aws-iam-authenticator (latest version)
RUN curl -L https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v${AWS_IAM_AUTH_VERSION}/aws-iam-authenticator_${AWS_IAM_AUTH_VERSION}_linux_amd64 \
        -o /usr/local/bin/aws-iam-authenticator && \
    chmod +x /usr/local/bin/aws-iam-authenticator

# Install awscli
RUN apk add --update --no-cache python3 groff && \
    pip3 install --upgrade pip && \
    pip3 install awscli==${AWSCLI_VERSION}

# Install doctl
RUN curl -L https://github.com/digitalocean/doctl/releases/download/v${DOCTL_VERSION}/doctl-${DOCTL_VERSION}-linux-amd64.tar.gz | tar xz && \
    mv doctl /usr/local/bin/doctl && \
    chmod +x /usr/local/bin/doctl

# Cleanup
RUN apk del .build-deps && \
    rm -rf /tmp/*

WORKDIR /app
