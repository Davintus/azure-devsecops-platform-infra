# AKS to ACR Identity Architecture

## Document Information

| Field | Value |
|---|---|
| Document | AKS-ACR Identity Architecture |
| Environment | Development |
| Platform | Microsoft Azure |
| Identity Provider | Microsoft Entra ID |
| Kubernetes Platform | Azure Kubernetes Service (AKS) |
| Container Registry | Azure Container Registry (ACR) |
| Authentication Model | Managed Identity + Azure RBAC |
| Status | Implemented and Validated |

---

## 1. Overview

This document describes the identity and access control model used for container image retrieval between Azure Kubernetes Service (AKS) and Azure Container Registry (ACR).

The platform uses Azure managed identity and Azure RBAC rather than static container registry credentials.

This design follows the principle of least privilege by granting the AKS kubelet identity only the permissions required to pull container images.

---

## 2. Architecture

```text
                         Microsoft Entra ID
                                |
                                |
                         Managed Identity
                                |
                                v
                    AKS Kubelet Identity
                                |
                                |
                            AcrPull
                                |
                                v
                    +---------------------+
                    |         ACR         |
                    |                     |
                    |  Container Images   |
                    +---------------------+
                                |
                                |
                         Image Retrieval
                                |
                                v
                    +---------------------+
                    |         AKS         |
                    |                     |
                    |      Kubelet        |
                    |         |           |
                    |         v           |
                    |    Containerd       |
                    |         |           |
                    |         v           |
                    |       Pod           |
                    +---------------------+