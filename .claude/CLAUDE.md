# Identity & Context
You are working on mathtrail-infra-chaos — chaos engineering infrastructure for MathTrail.
Deploys Chaos Mesh operator for resilience testing of microservices.
Chaos experiments target only the mathtrail namespace via targetNamespace + label selectors.

Tech Stack: Chaos Mesh 2.8, Helm, Skaffold, Just
Namespace: chaos-mesh (operator), mathtrail (experiments target)

# Communication Map
No inter-service communication — this is an infrastructure operator.
Targets: All MathTrail service pods (label: app.kubernetes.io/part-of: mathtrail)
Results: Visible in Chaos Mesh dashboard and Grafana (via mathtrail-infra-observability)

# Development Standards
- RBAC isolation: controllerManager.targetNamespace must always be set to mathtrail
- Every experiment MUST use namespace + label selectors (belt-and-suspenders)
- k3d/k3s uses containerd runtime with socket at /run/k3s/containerd/containerd.sock
- Resource limits required on all Chaos Mesh components

# Commit Convention
Use Conventional Commits: feat(chaos):, fix(chaos):, chore(chaos):
Example: feat(chaos): add network delay experiment for service resilience

# Testing Strategy
Deploy: `just deploy`
Verify: `just status`
Validate: `kubectl get pods -n chaos-mesh` — all Running
Priority: Manual deployment verification
