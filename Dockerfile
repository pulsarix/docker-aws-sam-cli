FROM alpine:3.7

ENV AWS_CLI_VERSION=1.18.119
ENV AWS_SAM_VERSION=1.3.0


RUN apk add --no-cache build-base python2-dev python3-dev py-pip && pip3 install awscli==${AWS_CLI_VERSION} aws-sam-cli==${AWS_SAM_VERSION} python-dotenv
RUN pip install --upgrade pip


WORKDIR /var/opt
EXPOSE 3000
ENTRYPOINT ["/usr/bin/sam"]
