# Docker image

### AWS sam local image for Docker

```bash
docker run -ti pulsarix/aws-sam-cli:latest --version                             
SAM CLI, version 0.53.0
```

Run aws lambda locally using aws-sam-cli with docker-compose.


```yaml
version: "3.5"
services:
  sam-local:
    image: pulsarix/aws-sam-cli:latest
    networks:
      - cloud
    environment:
      - "SAM_CLI_TELEMETRY=0"
      - "AWS_ACCESS_KEY_ID=bogus"
      - "AWS_SECRET_ACCESS_KEY=bogus"
    volumes:
      - ${PWD}:/var/opt:ro
      - $HOME/.aws:/root/.aws:ro
      - /var/run/docker.sock:/var/run/docker.sock:rw
    command: "local start-api --host 0.0.0.0 --skip-pull-image --docker-volume-basedir=${PWD} --docker-network=${COMPOSE_PROJECT_NAME}_cloud"
    ports:
      - 3000:3000
```
