# GitHub Actions → Azure OIDC Authentication

## Purpose

This document describes the passwordless authentication mechanism used by
GitHub Actions to access Azure resources in the Azure DevSecOps platform.

## Architecture

GitHub Actions authenticates to Microsoft Entra ID using OpenID Connect (OIDC).

No long-lived Azure client secret is stored in GitHub.

```text
GitHub Actions
      |
      | OIDC token
      v
Microsoft Entra ID
      |
      | Federated Identity Credential
      v
GitHub CI Managed Identity
      |
      | AcrPush
      v
Azure Container Registry