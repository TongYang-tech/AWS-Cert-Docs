# IAM - Policies

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

For more information, the policy reference is [here](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements.html). If you are using Terraform/OpenTofu, then more information is located [here](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document#statement).

#### Effect: Allow or Deny

The `Effect` determines the behavior of the policy:

- Allow: Grants permission to the action
- Deny: Denies permission to prevent access

### Policy Evaluation Order

When an entity performs an action on AWS resource, AWS will evaluate all the policies attached to
that entity as follows:

1. Explicit Deny: If any policy explicitly access to a resource, that denial takes
   precedence over any allows.
2. Explicit Allow: If there is no deny, an explicit allow will grant access to
   the resource.
3. Implicity Deny: If no policy explicitly allows access, the default behavior
   is to deny.

Priority Order: **Deny** -> **Allow** -> **Deny**

### Handling Multiple Policies

An entity can have multiple policies attached, either directly (user policy) or through groups.
AWS will collect all the policies that apply to a user or resource, then evaluates them
using the policy evaluation order.

### Inline vs Managed Policies

#### Inline Policies

**Inline policies** are directly attached to a specific entity (user, group, or role).
These policies are **unique** to that entity. Used for exceptions or special access
for individual entities.

#### Managed Policies

**Manged policies** are resuable policy documents that can be attached to multiple identities

### Summary

- IAM identity policies
- Structure of policy statements
- Evaluation Order for **allows** and **deny**
- Inline and Managed Policies

Link for the **Service Authorization Reference** is located [here](https://docs.aws.amazon.com/service-authorization/latest/reference/reference.html).
