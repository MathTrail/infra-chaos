# Chaos engineering infrastructure deployment commands for MathTrail

set shell := ["bash", "-c"]

NAMESPACE := "chaos-mesh"

# Deploy Chaos Mesh to the cluster
deploy:
    #!/bin/bash
    set -e
    echo "Deploying Chaos Mesh..."
    kubectl create namespace {{ NAMESPACE }} 2>/dev/null || true
    skaffold deploy
    echo ""
    echo "Deployment complete!"

# Remove Chaos Mesh from the cluster
uninstall:
    #!/bin/bash
    set -e
    echo "Removing Chaos Mesh..."
    skaffold delete
    echo ""
    echo "Removal complete!"

# Show Chaos Mesh status
status:
    #!/bin/bash
    echo "Chaos Mesh pods:"
    kubectl get pods -n {{ NAMESPACE }} 2>/dev/null || echo "  Not deployed"
    echo ""
    echo "Active chaos experiments:"
    kubectl get podchaos,networkchaos,stresschaos -n mathtrail 2>/dev/null || echo "  No experiments found"
