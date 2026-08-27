# ADR-001 — Azure DevSecOps Platform Architecture

## Status

Accepted

## Date

2026-08-26

## Context

The project requires a production-oriented DevSecOps platform capable of provisioning Azure infrastructure, deploying containerized workloads to Kubernetes, enforcing security policies, integrating security scanning into CI/CD, and providing centralized observability.

The original reference projects are AWS-oriented, but this implementation will use Microsoft Azure as the target cloud platform.

## Decision

The platform will use Azure as the primary cloud provider and will implement the following architecture:

* Terraform for Infrastructure as Code
* GitHub for source control
* GitHub Actions for CI/CD
* Microsoft Entra ID for identity
* GitHub OIDC federation for secretless Azure authentication
* Azure Container Registry for container images
* Azure Kubernetes Service for container orchestration
* ArgoCD for GitOps-based deployment
* Azure Key Vault for secrets and certificates
* External Secrets Operator for Kubernetes secret integration
* OPA Gatekeeper for Kubernetes policy enforcement
* Istio for service-to-service security and traffic management
* Azure Monitor, Managed Prometheus and Grafana for observability
* DefectDojo for centralized security finding management
* Azure Policy for cloud governance

## Rationale

Azure was selected because it aligns with the target platform engineering environment and allows the project to demonstrate practical Azure, Kubernetes and DevSecOps engineering skills.

GitHub was selected because GitHub Actions provides integrated CI/CD, security scanning capabilities and OIDC federation with Azure.

Terraform was selected because it provides reusable infrastructure modules, supports Azure effectively and demonstrates transferable Infrastructure as Code skills.

ArgoCD was selected to demonstrate GitOps-based continuous delivery and separation between application source code and deployment configuration.

## Consequences

### Positive

* Infrastructure becomes reproducible.
* CI/CD authentication does not require long-lived Azure credentials.
* Security controls are integrated into the software delivery lifecycle.
* Kubernetes configuration is managed declaratively.
* Infrastructure and application deployment are separated.
* The resulting architecture closely resembles a modern enterprise platform engineering environment.

### Negative

* The platform has significant operational complexity.
* Multiple Kubernetes controllers must be maintained.
* The project requires additional documentation and troubleshooting.
* Running all components in Azure may generate cloud costs.

## Alternatives Considered

### Azure DevOps

Rejected for this portfolio because GitHub Actions provides stronger alignment with the intended demonstration of modern GitHub-based DevSecOps workflows.

### GitLab CI/CD

Rejected because GitHub provides a broader portfolio signal for this project through GitHub Actions, OIDC, CodeQL and Dependabot.

### ARM/Bicep

Rejected as the primary IaC solution because Terraform provides greater portability and demonstrates broadly transferable Infrastructure as Code skills.

### Jenkins

Rejected as the primary CI/CD platform because the project focuses on a modern managed CI/CD approach rather than maintaining a separate CI server.

## Review

This decision should be revisited if the project requirements change to require Azure DevOps, GitLab or another enterprise CI/CD platform.
