# Porigins Server C++ - Infrastructure

GitOps infrastructure repository for Porigins Server C++ deployment using Kubernetes, Helm, and ArgoCD.

## 🏗️ Architecture

This repository contains the complete infrastructure-as-code for deploying the Porigins Server C++ game server:

- **Helm Charts**: Production-ready Kubernetes manifests
- **ArgoCD Applications**: GitOps deployment automation  
- **Multi-Environment**: Separate dev and production configurations
- **External Database**: Integration with existing MySQL cluster
- **Ingress & TLS**: Traefik integration with automatic certificates

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

## 🔄 CI/CD Integration

This repository integrates with the main server repository through:

1. **Automated Image Updates**: CI/CD pipeline updates `image-version.yaml` with new image tags
2. **GitOps Workflow**: ArgoCD automatically deploys changes when this repository is updated
3. **Multi-Environment**: Separate configurations for dev and production

### Image Version Updates

The `image-version.yaml` file is automatically updated by the CI/CD pipeline:

```yaml
image:
  tag: "abc123def456"
  sha: "abc123def456"
  updated: "2025-06-20T10:30:00Z"
  commit_url: "https://github.com/DistTopic/porigins-server-cpp/commit/abc123def456"
  build_number: "42"
```

### Docker Image Tags

The CI/CD pipeline follows the same naming convention as the reference repositories:
- `latest` - Latest build from main branch
- `<sha>` - Specific commit SHA
- `main-<sha>` - Branch-specific tags

## Deployment

The infrastructure is automatically deployed using ArgoCD. Changes to this repository trigger automatic deployments to the respective environments.
