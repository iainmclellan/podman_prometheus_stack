FROM docker.io/grafana/grafana


RUN sudo apt-get update && apt-get upgrade

COPY grafana.ini /etc/grafana/grafana.ini
COPY datasources.yaml /etc/grafana/provisioning/datasources/datasources.yaml
COPY dashboards.yaml /etc/grafana/provisioning/dashboards/dashboards.yaml

HEALTHCHECK  --interval=5m --timeout=3s \
CMD wget --no-verbose --tries=1 --spider http://localhost:3000 || exit 1
