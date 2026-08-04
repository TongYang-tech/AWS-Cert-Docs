# IAM - Users

### Overview

IAM (Identity and Access Management) Users are the core entity types in AWS. They
are used when you need to assign access to an individual such as a person, application,
or a service account

### IAM Users Overview

IAM users represent identities in AWS that require long-term access

- Humans: James, Mike, or Miles
- Applications: A backup app running in a laptop
- Service Accounts: If a service accounts needs access to AWS resources

#### Key Concepts

- Principle: An entity trying to accesss AWS resources. Initially, any entity is unidentified.
- Authentication: Verifying that principle who they are. IAM users authenticate using.
- Authorization: AWS checks which policies apply to the authenticate identity and is authorized to do things.

### Authentication Process

1. Principle: A person or application attempts to access AWS resources.
2. Authentication: The principle provides credentials to prove who they are.
3. Authenticated Identity: The principle becomes an authenticated identity.
4. Authorization: AWS checks the policies attached to the identity and
   determines if the action is allowed.

### ARNs (Amazon Resource Names)

ARNs uniquely identity resources in AWS, allloing interaction through the CLI or API

```
arn:partition:service:region:account-id:resource-id
arn:partition:service:region:account-id:resource-id:resource-type/resource-id
arn:partition:service:region:account-id:resource-id:resource-id
```

Examples

```
arn:aws:s3:::catgifs
arn:aws:s3:::catgifs/*
```

#### Format of ARNS

```
arn:partition:service:region:account-id:resource
```

- Partition: The AWS env (usually `aws`)
- Service: The AWS service such as `s3`, `iam`, or `ec2`
- Region: Where the resource is located
- Account ID: AWS account number that owns the resource
- Resource: Specific resouce being referenced (e.g., an S3 bucket or EC2 instance)

#### ARN Usage in Policies

ARNs are often used in IAM policies to specify resources that a policy applies
to. Policies can **allow** or **deny** on specific resources

#### Common ARN Mistakes

Confusing the bucket ARN with the object ARN. Actions on buckets require the bucket
ARN, while actions on objects require the object ARN with the wild card. More information
is provided in the link [here](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html).

### IAM Users and Limitations

#### Limits

- Max 5,000 IAM users per AWS account
- IAM users can be part of to 10 IAM groups

#### Design Considerations

If need more than 5,000 identities then consider:

- Use IAM roles: For applications, service accounts, or other AWS services
- Identity Federation: For integrating existing identities from external identity providers

#### Federation vs IAM Users

- Large orgs or internet-scale apps, using federation or IAM roles is often the right solution

## Summary of Key Points

- IAM users are core entity to AWS. They represent humans, applications, or service accounts
- IAM users are principles that will need to be authenticated and authorized in AWS to perform
  actions to AWS resources.
- Amazon Resource Names (ARNs) uniquely identity a resource in AWS.
- Limit of 5,000 IAM users per account.
- In most cases, use Federation or IAM roles for applications, services accounts, or other AWS services.
