# ADR-002 — Azure Network Architecture

## Status

Accepted

## Date

2026-09-05

## Context

The Azure DevSecOps platform requires a network foundation capable of supporting Azure Kubernetes Service, application ingress, private Azure services and future network-security controls.

The network must provide logical segmentation while leaving sufficient address space for future platform growth.

## Decision

The platform will use a dedicated Azure Virtual Network with the address space:

`10.10.0.0/16`

The initial subnet structure is:

| Subnet              | CIDR         | Purpose                                       |
| ------------------- | ------------ | --------------------------------------------- |
| AKS System          | 10.10.1.0/24 | Kubernetes system workloads                   |
| AKS User            | 10.10.2.0/24 | Application workloads                         |
| Application Gateway | 10.10.3.0/24 | Application ingress                           |
| Private Endpoints   | 10.10.4.0/24 | Private connectivity to Azure services        |
| Azure Firewall      | 10.10.5.0/26 | Reserved for future network security controls |

The network will be provisioned using Terraform modules.

The Application Gateway subnet is reserved for the future web application ingress architecture.

The Azure Firewall subnet is reserved but the firewall will not be deployed until a demonstrated requirement exists.

## Rationale

A dedicated VNet provides isolation and predictable network address management.

Separate AKS system and user subnets provide logical segmentation between Kubernetes infrastructure and application workloads.

A dedicated Application Gateway subnet allows the platform to introduce a managed Layer 7 ingress and WAF capability without restructuring the VNet.

A reserved Azure Firewall subnet allows future centralized egress filtering and network inspection to be introduced without changing the overall address plan.

Terraform provides repeatability, version control and peer-reviewable network changes.

## Security Principles

The network will follow:

* Least privilege
* Network segmentation
* Default-deny where practical
* Explicitly permitted traffic
* Private connectivity for sensitive Azure services
* Infrastructure as Code
* Centralized monitoring
* Auditable changes

## Alternatives Considered

### Single flat subnet

Rejected because it provides insufficient network segmentation.

### Separate VNet for every platform component

Rejected at this stage because it introduces unnecessary peering and routing complexity for the initial platform.

### Azure Firewall from day one

Deferred because it introduces additional cost and routing complexity before there is a workload requiring centralized inspection.

### Manual Azure portal configuration

Rejected because networking must be reproducible and reviewable through Infrastructure as Code.

## Consequences

### Positive

* Clear network segmentation
* Predictable address allocation
* Easy future expansion
* Terraform-managed network configuration
* Application Gateway and private endpoint integration can be added without redesigning the address space

### Negative

* Multiple subnets increase configuration complexity.
* Future AKS networking decisions must remain compatible with the subnet architecture.
* Additional security controls such as Azure Firewall will introduce additional cost and routing requirements.

## Future Considerations

The architecture may later introduce:

* Azure Firewall
* User Defined Routes
* Private AKS
* Private DNS Zones
* Private ACR
* Private Key Vault
* Network Watcher
* NSG Flow Logs
* Hub-and-spoke topology

These components should be introduced when the platform's security and operational requirements justify them.