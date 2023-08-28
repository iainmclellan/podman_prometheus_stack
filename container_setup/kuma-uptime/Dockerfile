FROM docker.io/elestio/uptime-kuma

USER nonroot 

RUN sudo apt-get update && apt-get upgrade

COPY kuma-uptime.yaml /etc/kuma-uptime.yaml

HEALTHCHECK  --interval=5m --timeout=3s \
CMD wget --no-verbose --tries=1 --spider http://localhost:3031 || exit 1