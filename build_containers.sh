#!/bin/bash

# Create network
podman network create prometheus_network

# Build Prometheus Container
buildah bud -t prometheus-container ./container_setup/prometheus

# Build Alertmanager Container
buildah bud -t alertmanager-container ./container_setup/alertmanager

# Build Grafana Container
buildah bud -t grafana-container ./container_setup/grafana

# Build Traefik Container
buildah bud -t traefik-container ./container_setup/traefik

# # Build Kuma Uptime Container
buildah bud -t kuma-uptime-container ./container_setup/kuma-uptime

# Build Node Exporter Container
buildah bud -t node-exporter-container ./container_setup/node-exporter

# Build cAdvisor Container
buildah bud -t cadvisor-container ./container_setup/cadvisor

# Run Traefik Container
podman run -d --name=traefik --network=prometheus_network -p 8080:80 traefik-container

# Run Prometheus Container with Traefik labels
podman run -d --name=prometheus --network=prometheus_network -p 9090:9090 \
  -l "traefik.http.routers.prometheus.rule=Host(`prometheus.example.com`)" \
  prometheus-container

# Run Alertmanager Container with Traefik labels
podman run -d --name=alertmanager --network=prometheus_network -p 9093:9093 \
  -l "traefik.http.routers.alertmanager.rule=Host(`alertmanager.example.com`)" \
  alertmanager-container

# Run Grafana Container with Traefik labels
podman run -d --name=grafana --network=prometheus_network -p 3000:3000 \
  -l "traefik.http.routers.grafana.rule=Host(`grafana.example.com`)" \
  grafana-container

# Run Kuma Uptime Container with Traefik labels
podman run -d --name=kuma-uptime --network=prometheus_network -p 3001:3001 \
  -l "traefik.http.routers.kuma-uptime.rule=Host(`kuma-uptime.example.com`)" \
  kuma-uptime-container

# Run Node Exporter Container
podman run -d --name=node-exporter --network=prometheus_network -p 9100:9100 \
  node-exporter-container

# Run cAdvisor Container
podman run -d --name=cadvisor --network=prometheus_network -p 8081:8081 \
  cadvisor-container