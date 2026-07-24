# Introduction

An AWS account is a container for both identities (users) and resources
(AWS EC2, AWS S3, and etc).

Identities: Users who log in and manage the accounts
Resources: The infrastructure you build inside the cloud.

# Creating AWS Accounts

Once you create an account, a _root user_ is created and cannot be restricted.

# Billing

Most services are "pay-as-you-go" model, usually by the minute.

# Security: Root Users and IAM

### Root User

- Full control: Unrestricted access
- Be careful: It can be compromised

### IAM (Identity and Access Management)

IAM allows you to create identities (users, groups, roles) within your AWS Account. IAM identities start
with no permissions by default and permissions have to be created, allowing extra
security.

### Cross-Account Permissions

These permissions allow access to resources across AWS Accounts.

# AWS Account Boundaries

Consider the boundaries of an AWS Account as a security wall:

- Keep things inside: Any deletions occurs within that AWS account
- Keep things outside: By default, no external identity can access the account explicitly allowed

# Why Use Seperate Accounts

- Isolate Potential Damage: Only contained within specific accounts
- Better Management: Seperate accounts for different teams or products enable better resource and security
