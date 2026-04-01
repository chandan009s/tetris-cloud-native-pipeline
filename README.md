# 🚀 Tetris Cloud-Native Pipeline

A **production-grade DevOps pipeline** built around a containerized Tetris web app, demonstrating end-to-end CI/CD, GitOps, security scanning, and observability.

---

## 📌 Pipeline Architecture


Code Push → GitHub Actions → Trivy Scan → SonarQube → Docker Hub → ArgoCD → Kubernetes → Prometheus → Grafana


---

## 🧰 Tech Stack

| Tool            | Purpose |
|-----------------|--------|
| Docker          | Containerization |
| GitHub Actions  | CI pipeline |
| Trivy           | Security scanning |
| SonarQube       | Code quality analysis |
| Docker Hub      | Image registry |
| Kubernetes      | Container orchestration |
| ArgoCD          | GitOps continuous delivery |
| Prometheus      | Metrics collection |
| Grafana         | Visualization & alerting |

---

## ⚙️ CI Pipeline Jobs


build → scan (Trivy) → sonarqube → push


- **Build**: Docker image built & tagged  
- **Scan**: Trivy blocks CRITICAL/HIGH vulnerabilities  
- **SonarQube**: Quality gate enforced  
- **Push**: Image pushed to Docker Hub  

---

## 🎯 Key Achievements

- 🔐 Blocked real CVE in `nginx:alpine` using Trivy  
- 🚀 Zero-downtime rolling updates with Kubernetes  
- 🔁 ArgoCD auto-sync (GitOps) without manual intervention  
- 📈 Grafana dashboards with 10+ real-time metrics  
- ⚙️ Fully automated CI/CD pipeline  

---

## 🚀 Local Setup (Complete Guide)

## 🔧 Prerequisites

Install:


Docker

kubectl

minikube

git


Verify:

```bash
docker --version
kubectl version --client
minikube version
🧱 1. Start Kubernetes Cluster
minikube start --driver=docker

Enable addons:

minikube addons enable ingress
minikube addons enable metrics-server
📦 2. Clone Repository
git clone https://github.com/chandan009s/tetris-cloud-native-pipeline.git
cd tetris-cloud-native-pipeline
🚀 3. Deploy Application
kubectl apply -f k8s/

Verify:

kubectl get pods
kubectl get svc
kubectl get deployments
🌐 4. Configure Domain (Ingress)
echo "$(minikube ip) tetris.local" | sudo tee -a /etc/hosts

Check ingress:

kubectl get ingress
🎮 5. Access Application

Open in browser:

http://tetris.local
🔁 6. Access ArgoCD
kubectl port-forward svc/argocd-server -n argocd 8080:443

Get password:

kubectl get secret argocd-initial-admin-secret -n argocd \
-o jsonpath="{.data.password}" | base64 -d && echo
📊 7. Access Grafana
kubectl port-forward svc/monitoring-grafana -n monitoring 3000:80

Get password:

kubectl get secret monitoring-grafana -n monitoring \
-o jsonpath="{.data.admin-password}" | base64 -d && echo
🔐 8. Run Trivy Scan
trivy image chandans19/tetris:latest
🔄 9. Test GitOps Flow
git add .
git commit -m "test gitops"
git push


👉 Observe:
- GitHub Actions runs CI  
- Image pushed to Docker Hub  
- ArgoCD auto-syncs  
- Kubernetes updates pods  

---

## ⚡ Advanced Operations

### Scale Application


kubectl scale deployment tetris --replicas=3


### Check Rolling Updates


kubectl rollout status deployment/tetris


---

## 📊 Observability

- Prometheus scrapes cluster metrics  
- Grafana visualizes:
  - CPU usage  
  - Memory usage  
  - Pod health  
  - Network & disk metrics  

---

## 🔐 Security

- Trivy scans container images  
- Blocks HIGH/CRITICAL vulnerabilities  
- Ensures secure production-ready builds  

---

## 📅 Project Date

**March 2026**

---

## 🚀 Future Improvements

- Helm chart support  
- Multi-environment (dev/staging/prod)  
- Horizontal Pod Autoscaling (HPA)  
- Canary deployments  
- Terraform for infra provisioning  

---

## 💡 Key Learnings

- CI/CD pipeline design  
- GitOps with ArgoCD  
- Kubernetes networking (Ingress, Services)  
- DevSecOps (security scanning)  
- Observability & monitoring  

---

## ⭐ If you found this useful

Give it a ⭐ on GitHub and feel free to contribute!
