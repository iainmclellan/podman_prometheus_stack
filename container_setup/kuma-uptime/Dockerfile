FROM docker.io/elestio/uptime-kuma

RUN apt-get update && apt-get upgrade -y

USER nonroot 

COPY kuma-uptime.yaml /etc/kuma-uptime.yaml

HEALTHCHECK  --interval=5m --timeout=3s \
CMD wget --no-verbose --tries=1 --spider http://localhost:3001 || exit 1