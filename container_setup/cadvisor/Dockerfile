FROM docker.io/gcr.io/cadvisor/cadvisor

RUN sudo apt-get update && apt-get upgrade 

COPY cadvisor.yaml /etc/cadvisor/cadvisor.yml

HEALTHCHECK  --interval=5m --timeout=3s \
CMD wget --no-verbose --tries=1 --spider http://localhost:8081 || exit 1