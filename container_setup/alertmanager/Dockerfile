FROM docker.io/bitnami/alertmanager

RUN apt-get update && apt-get upgrade -y

USER nonroot

COPY alert_manager.yaml /etc/alertmanager/alertmanager.yml

HEALTHCHECK  --interval=5m --timeout=3s \
CMD wget --no-verbose --tries=1 --spider http://localhost:9093 || exit 1