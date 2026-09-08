# RUNBOOK-001 — AKS to ACR Image Pull Validation

## Document Information

| Field | Value |
|---|---|
| Runbook ID | RUNBOOK-001 |
| Title | AKS to ACR Image Pull Validation |
| Environment | Development |
| Platform | Microsoft Azure |
| Kubernetes Platform | Azure Kubernetes Service (AKS) |
| Container Registry | Azure Container Registry (ACR) |
| Authentication Model | Managed Identity |
| Status | Validated |

---

## 1. Purpose

This runbook provides the procedure for validating that Azure Kubernetes Service (AKS) workloads can successfully pull container images from Azure Container Registry (ACR) using Azure identity-based authentication.

The validation is designed to confirm that:

- AKS can authenticate to ACR using its managed identity.
- The AKS kubelet identity has the required `AcrPull` permission.
- ACR administrative credentials are not required.
- Kubernetes `imagePullSecrets` are not required.
- A container image can be successfully retrieved and started by an AKS workload.

---

## 2. Architecture

The image pull flow is:

```text
                    Azure Container Registry
                              |
                              | AcrPull
                              |
                              v
                    AKS Kubelet Identity
                              |
                              v
                         AKS Node
                              |
                              v
                       Containerd
                              |
                              v
                         Kubernetes
                            Pod