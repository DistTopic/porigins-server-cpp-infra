# Porigins Server C++ Infrastructure

This repository contains the Kubernetes infrastructure configurations for the Porigins Server C++ application.

## GitOps Pattern

This repository follows the GitOps pattern where:
- **porigins-server-cpp**: Contains the application source code and Dockerfile
- **porigins-server-cpp-infra**: Contains Kubernetes manifests and Helm charts

## Structure

```
├── apps/                           # ArgoCD Application definitions
├── charts/porigins-server-cpp/     # Helm chart templates
├── porigins-server-cpp-dev/        # Development environment configurations
├── porigins-server-cpp-prod/       # Production environment configurations
└── image-versions/                 # Container image version tracking
```

## Environments

- **Development**: porigins-server-cpp-dev
- **Production**: porigins-server-cpp-prod

## Features

- Kubernetes deployment with MySQL database
- ConfigMap for server configuration
- Persistent volumes for game data
- Horizontal Pod Autoscaler (HPA)
- Load balancer service
- ArgoCD automated sync

## Deployment

The infrastructure is automatically deployed using ArgoCD. Changes to this repository trigger automatic deployments to the respective environments.
