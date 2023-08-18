FROM docker.io/bitnami/prometheus

RUN sudo apt-get update && apt-get upgrade 

COPY prometheus.yaml /etc/prometheus/prometheus.yml

HEALTHCHECK  --interval=5m --timeout=3s \
CMD wget --no-verbose --tries=1 --spider http://localhost:9090 || exit 1