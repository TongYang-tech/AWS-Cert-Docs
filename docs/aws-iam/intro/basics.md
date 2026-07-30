# Introduction

These policies in AWS control access by attaching permissions to users, groups,
and roles. They **deny** or **allow** access to AWS services and resource.

### Understanding IAM Policies

**IAM Policies** are documents written in JSON format and are attached to Entities
including users, groups, and roles. If you want to communicate to AWS resources,
an entity must authenticate and have policies to be attached that would either allow
or deny specific actions.

- Policies are attached to users, groups, and roles
- Policies are JSON documents that may have one or more statements
- AWS evaluate policies based on actions made by entities

### IAM Policy Architecture

Policies consist of **one or more statments** to allow or deny permissions

#### Statement Structure

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "FullAccess",
      "Effect": "Allow",
      "Action": ["s3:*"],
      "Resource": ["*"]
    },
    {
      "Sid": "DenyCatBucket",
      "Action": ["s3:*"],
      "Effect": "Deny",
      "Resource": ["arn::aws:s3::catgis", "arn::aws:s3:::catgifs/*"]
    }
  ]
}
```

The core syntax for a policy statement is composed in the following:

- Statement ID (Sid): ID for policy statement
- Action: A specific operation that will be allowed or denied
- Resource: Specifies the AWS resource (ARN) the policy applies to
- Effect: Describes whether to `allow` or `deny`

For more information, the policy reference is [here](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements.html)

#### Effect: Allow or Deny

The `Effect` determines the behavior of the policy:

- Allow: Grants permission to the action
- Deny: Denies permission to prevent access
