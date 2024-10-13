# ArgoCD Setup

This repository contains an interactive bash script for setting up ArgoCD on a Kubernetes cluster. The script provides a menu-driven interface to perform various ArgoCD setup tasks individually or in sequence.

## Features

The script offers the following operations:

1. Install ArgoCD
2. Get ArgoCD secret (admin password)
3. Set up port-forwarding
4. Add load balancer

## Prerequisites

- A Kubernetes cluster
- `kubectl` installed and configured to work with your cluster
- Necessary permissions to create resources in your cluster

## Usage

1. Clone this repository:
   ```
   git clone https://github.com/yourusername/argocd-setup.git
   cd argocd-setup
   ```

2. Make the script executable:
   ```
   chmod +x setup.sh
   ```

3. Run the script:
   ```
   ./setup.sh
   ```

4. Follow the on-screen menu to perform desired operations.

## Menu Options

- **Install ArgoCD**: Creates a namespace for ArgoCD and installs it using the official manifest.
- **Get ArgoCD Secret**: Retrieves and decodes the initial admin password for ArgoCD.
- **Set up Port-Forwarding**: Establishes port-forwarding to access the ArgoCD UI locally.
- **Add Load Balancer**: Patches the ArgoCD server service to use a LoadBalancer for external access.

## Notes

- The script assumes you have the necessary permissions in your Kubernetes cluster.
- Port-forwarding (option 3) will run in the background. Press Enter to stop it when you're done.
- After adding a load balancer (option 4), it may take a few minutes for an external IP to be assigned.

## Contributing

Contributions to improve the script or documentation are welcome. Please feel free to submit a pull request or open an issue for any bugs or feature requests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.