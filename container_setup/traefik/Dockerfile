FROM docker.io/traefik:v2.5

USER nonroot

RUN sudo apt-get update && apt-get upgrade

# Configure Traefik here (entrypoints, middlewares, routers, etc.)
COPY traefik-config.yaml /etc/traefik/traefik-config.yaml

HEALTHCHECK  --interval=5m --timeout=3s \
CMD wget --no-verbose --tries=1 --spider http://localhost:8080 || exit 1