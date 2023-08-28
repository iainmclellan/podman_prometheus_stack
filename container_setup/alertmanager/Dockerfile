FROM docker.io/bitnami/alertmanager

USER nonroot

RUN sudo apt-get update && apt-get upgrade

COPY alert_manager.yaml /etc/alertmanager/alertmanager.yml

HEALTHCHECK  --interval=5m --timeout=3s \
CMD wget --no-verbose --tries=1 --spider http://localhost:8080 || exit 1