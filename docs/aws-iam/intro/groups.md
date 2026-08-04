# IAM - Groups

### What are IAM Groups?

An **IAM Group** is a container used to organize **IAM Users**. This allows for
easier management of large sets of users by assigning common permissions to multiple
users simultaneously.

#### Key Features

- **No Credentials**: IAM groups do not have credentials of their own, so you can't
  log into an IAM group.
- **Multiple Group Membership**: An IAM user can belong to multiple groups.

### Benenfits of Using IAM Groups

#### 1. Effective User Management

- Groups help organize users by teams, roles, or other criteria.

#### 2. Policy Attachment

- **Policies** (both **in-line** and **managed**) can be attached to IAM groups
- When a user is added to a group, they inherit all the permissions associated
  with that group.

### Policy Evaluation

When evaluating whether an IAM user can perform an action, AWS considers:

- **Direct Policies** attached to the user.
- **Policies from Group Memberships**.

If an IAM user is part of multiple groups, all policies are collected and evaluated
together. The usual **allow-deny** rule applies--denies take precedence over allows.

### IAM Group Limitations

While IAM groups help with user management, there are important limitations:

#### 1. No Nested Groups

- You **cannt nest IAM groups**. A group can only container users.

#### 2. Group Limits

- Limit of **300 groups per AWS account**, but can be increased via support request.
- Users can belong to **up to 10 groups**, and there is a hard limit of **5,000 IAM users**
  per account.

#### 3. No "All Users" Group

- IAM does not provide a built-int "All Users" group. You would have to manually create
  a group and add all users to it.

### Resource Policies and IAM Groups

**Resource Policies** allow access control at the resource level (e.g., for S3 Buckets),
and they can reference IAM users and roles by using their **Amazon Resource Name (ARN)**.

#### Important Limitations:

- **IAM Groups** cannot be referenced in **resource policies**. Resource policies can only
  grant access to **IAM Users** or **IAM Roles**--not to IAM groups.

For instance, you can't attach a policy to an S3 bucket that grants access to "Developer"
gruops directly. You would grant access to individual IAM users in that group instead.

## Summary of Key Points

- **IAM Groups** help manage permissions for multiple users, but you can't log into them, and don't have credentials.
- Groups allow you to attach policies that are inherited by all users in that group.
- IAM groups can't be reference in **resource policies**
- There are lmits on the number of groups and users in an account
- IAM groups simplify user management but have strict limitations, such as no nesting
  and no built-in "all users" groups.
