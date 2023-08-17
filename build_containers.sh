#!/bin/bash

# Create network
podman network create prometheus_network

# Build Prometheus Container
buildah bud -t my-prometheus-container ./prometheus

# Build Alertmanager Container
buildah bud -t my-alertmanager-container ./alertmanager

# Build Grafana Container
buildah bud -t my-grafana-container ./grafana

# Build Traefik Container
buildah bud -t my-traefik-container ./traefik

# Build Kuma Uptime Container
buildah bud -t my-kuma-uptime-container ./kuma-uptime

# Run Traefik Container
podman run -d --name=traefik --network=prometheus_network -p 80:80 -p 8080:8080 my-traefik-container

# Run Prometheus Container with Traefik labels
podman run -d --name=prometheus --network=prometheus_network -p 9090:9090 \
  -l "traefik.http.routers.prometheus.rule=Host(`prometheus.example.com`)" \
  my-prometheus-container

# Run Alertmanager Container with Traefik labels
podman run -d --name=alertmanager --network=prometheus_network -p 9093:9093 \
  -l "traefik.http.routers.alertmanager.rule=Host(`alertmanager.example.com`)" \
  my-alertmanager-container

# Run Grafana Container with Traefik labels
podman run -d --name=grafana --network=prometheus_network -p 3000:3000 \
  -l "traefik.http.routers.grafana.rule=Host(`grafana.example.com`)" \
  my-grafana-container

# Run Kuma Uptime Container with Traefik labels
podman run -d --name=kuma-uptime --network=prometheus_network -p 3001:3001 \
  -l "traefik.http.routers.kuma-uptime.rule=Host(`kuma-uptime.example.com`)" \
  my-kuma-uptime-container
