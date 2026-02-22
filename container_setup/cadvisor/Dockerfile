FROM gcr.io/cadvisor/cadvisor

RUN apt-get update && apt-get upgrade -y

USER nonroot 

COPY cadvisor.yaml /etc/cadvisor/cadvisor.yml

HEALTHCHECK  --interval=5m --timeout=3s \
CMD wget --no-verbose --tries=1 --spider http://localhost:8081 || exit 1