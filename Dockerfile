FROM alpine:3.7

ENV VERSION=0.40.0

RUN apk add --no-cache build-base python2-dev python3-dev py-pip && pip install awscli aws-sam-cli==${VERSION}

WORKDIR /var/opt
EXPOSE 3000
ENTRYPOINT ["/usr/bin/sam"]
