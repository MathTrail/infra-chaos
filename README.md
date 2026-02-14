# mathtrail-infra-chaos

Chaos engineering infrastructure for the MathTrail platform. Deploys [Chaos Mesh](https://chaos-mesh.org/) operator for automated resilience testing of microservices.

## What It Does

- Deploys Chaos Mesh operator to `chaos-mesh` namespace
- Scoped to `mathtrail` namespace only (cannot affect system components)
- Supports pod-kill, network delay, and stress experiments
- Three-layer RBAC isolation: targetNamespace + namespace selector + label selector

## Quick Start

```bash
just deploy     # Deploy Chaos Mesh operator
just status     # Check operator and active experiments
just uninstall  # Remove Chaos Mesh
```

## Experiment Management

Chaos experiments are managed via GitOps in [mathtrail-gitops/apps/chaos/](../mathtrail-gitops/apps/chaos/).
