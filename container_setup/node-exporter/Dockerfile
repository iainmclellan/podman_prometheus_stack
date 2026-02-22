FROM docker.io/bitnami/node-exporter

RUN apt-get update && apt-get upgrade -y

USER nonroot 

HEALTHCHECK  --interval=5m --timeout=3s \
CMD wget --no-verbose --tries=1 --spider http://localhost:9100 || exit 1