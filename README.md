# Tetris Cloud-Native Pipeline

A production-grade DevOps pipeline built around a containerized Tetris web app.

## Pipeline Architecture
```
Code Push → GitHub Actions → Trivy Scan → SonarQube → Docker Hub → ArgoCD → Kubernetes
```

## Tech Stack

| Tool | Purpose |
|------|---------|
| Docker | Containerization, 5+ versioned images |
| GitHub Actions | CI pipeline with 4 separate jobs |
| Trivy | CVE scanning, blocks CRITICAL/HIGH vulnerabilities |
| SonarQube | Code quality gates on every push |
| Kubernetes | Container orchestration, zero-downtime rollouts |
| ArgoCD | GitOps CD, auto-syncs Git to cluster in ~2 minutes |
| Prometheus | Metrics scraping, 10+ application metrics |
| Grafana | Dashboards and proactive alerting |

## Pipeline Jobs
```
build → scan (Trivy) → sonarqube → push
```

- Build: Docker image built and saved as artifact
- Scan: Trivy blocks any CRITICAL/HIGH CVEs
- SonarQube: Quality gate must pass
- Push: Image pushed to Docker Hub with SHA tag + latest

## Key Achievements

- Blocked real CVE (CVE-2026-22184) in nginx:alpine during Trivy scan
- Zero-downtime rolling updates verified with 2 replicas
- ArgoCD auto-synced replica change from 2→3 without any kubectl commands
- Grafana dashboard tracking 10+ metrics with pod restart alerting

## Local Setup
```bash
# Start cluster
minikube start --driver=docker

# Deploy app
kubectl apply -f k8s/

# Access app
echo "$(minikube ip) tetris.local" | sudo tee -a /etc/hosts
# Open http://tetris.local

# Start ArgoCD
kubectl port-forward svc/argocd-server -n argocd 8080:443
# Open https://localhost:8080

# Start Grafana
kubectl port-forward svc/monitoring-grafana -n monitoring 3000:80
# Open http://localhost:3000
```

## Project Date
March 2026
