#!/bin/bash

# Function to install ArgoCD
install_argocd() {
    echo "Installing ArgoCD..."
    kubectl create namespace argocd
    kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
    echo "ArgoCD installed successfully."
}

# Function to get ArgoCD secret
get_secret() {
    echo "Retrieving ArgoCD admin password..."
    PASSWORD=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)
    echo "ArgoCD admin password: $PASSWORD"
}

# Function to set up port-forwarding
setup_port_forward() {
    echo "Setting up port-forwarding..."
    kubectl port-forward svc/argocd-server -n argocd 8080:443 &
    PORT_FORWARD_PID=$!
    echo "Port-forwarding set up. ArgoCD UI available at https://localhost:8080"
    echo "Press Enter to stop port-forwarding."
    read
    kill $PORT_FORWARD_PID
}

# Function to add load balancer
add_load_balancer() {
    echo "Adding Load Balancer..."
    kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
    echo "Load Balancer added. It may take a few minutes for an external IP to be assigned."
}

# Main menu
while true; do
    echo "ArgoCD Setup Menu:"
    echo "1. Install ArgoCD"
    echo "2. Get ArgoCD secret"
    echo "3. Set up port-forwarding"
    echo "4. Add load balancer"
    echo "5. Exit"
    read -p "Enter your choice (1-5): " choice

    case $choice in
        1) install_argocd ;;
        2) get_secret ;;
        3) setup_port_forward ;;
        4) add_load_balancer ;;
        5) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid option. Please try again." ;;
    esac

    echo
done