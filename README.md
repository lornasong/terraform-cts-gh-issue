# GitHub Issues Module for Consul Terraform Sync

This Terraform module creates a repo and GitHub issue labels. Using this module in automation with [Consul Terraform Sync (CTS)](https://www.consul.io/docs/nia) will dynamically create or delete GitHub issue labels based off of configured services. This module is useful for testing CTS with a provider that supports multiple accounts/instances without setting up infrastructure.

## Feature

The module uses the `github` Terraform provider to create a repository named 'cts-issues' in the configured GitHub account. It creates GitHub issue labels within this repository with the name of the monitored Consul service instances.

## Requirements

### Ecosystem Requirements

| Ecosystem | Version |
|-----------|---------|
| [consul](https://www.consul.io/downloads) | >= 1.7 |
| [consul-terraform-sync](https://www.consul.io/docs/nia) | >= 0.1.0 |
| [terraform](https://www.terraform.io) | >= 0.13 |

### Terraform Providers

| Name | Version |
|------|---------|
| github | >= 4.5.2 |

## Setup

A GitHub personal access token is required in order to use this module:
1. Create a GitHub account
1. Create a [personal access token](https://docs.GitHub.com/en/GitHub/authenticating-to-GitHub/creating-a-personal-access-token) in GitHub

## Usage

**User Config for Consul Terraform Sync**

example.hcl
```hcl
task {
  name           = "github_issues"
  source         = "namespace/your-module"
  version        = "0.0.0"
  providers      = ["github"]
  services       = ["api"]
}

driver "terraform" {
  required_providers = {
    myprovider = {
      source  = "namespace/myprovider"
      version = "1.1.2"
    }
  }
}

terraform_provider "github" {
  token = "<GIT PERSONAL ACCESS TOKEN>"
  // See ['Securely Configure Terraform Providers'](https://www.consul.io/docs/nia/configuration#securely-configure-terraform-providers) for alternatives to inserting token here
}
```
