# AWS Deployment Prerequisite

To trigger the `terraform apply` command and create the configured resources within Amazon Web Services (AWS) using GitHub Actions, we utilize Open ID Connect Provider(OIDC Provider). Open ID Connect Providern enables fine-grained scoping, short-lived credentials, and minimal management overhead for authentication.

## Open ID Connect Provider Overview

The Open ID Connect Provider (OIDC Provider) is a component used to enable the execution of the terraform apply command and the creation of resources in Amazon Web Services (AWS) through the integration with GitHub Actions. The OIDC Provider facilitates authentication and provides various benefits such as fine-grained scoping, short-lived credentials, and minimal management overhead.

When using the OIDC Provider, it allows for secure and controlled access to AWS resources by implementing OpenID Connect (OIDC) authentication protocol. This protocol enables the exchange of identity information between the OIDC Provider and AWS. It utilizes industry-standard security practices, including OAuth 2.0, to verify and authenticate users.

The OIDC Provider allows for the creation of fine-grained access controls by defining scopes. Scopes determine the level of access granted to users based on their roles and permissions. By using scopes, you can limit the permissions of each individual user, ensuring that they only have access to the resources and actions they need.

Additionally, the OIDC Provider issues short-lived credentials to authenticate users. These credentials have a limited lifespan, reducing the risk of unauthorized access. This approach enhances the security of your AWS resources by regularly rotating credentials and mitigating the impact of potential security breaches.

Furthermore, the OIDC Provider reduces management overhead by providing a centralized authentication mechanism. It eliminates the need to manage individual AWS access keys or IAM users for authentication purposes. This simplifies the authentication process and reduces the administrative burden associated with managing credentials.

Overall, the Open ID Connect Provider offers a secure and efficient way to trigger the terraform apply command and create AWS resources within GitHub Actions. It combines fine-grained access controls, short-lived credentials, and minimal management overhead to ensure robust authentication for your infrastructure provisioning workflows.



![Architecture Diagram](./images/AWS_GA_Arch.avif)

## Create an OpenID Connect Identity provider


The first step is to create an OpenID Connect (OIDC) identity provider in your AWS Account. This will allow Github to identify itself.

1. Got to the IAM console -> Identity providers
2. Click Add new provider
3. Select OpenID Connect
4. Provider Url: `https://token.actions.githubusercontent.com` (Don't forget to click Get Thumbprint)
5. Audience: `sts.amazonaws.com`
6. Add tags if you want to and click Add Provider


## Create an IAM role

You now need to create a role that Github will be able to assume in order to access the resources it needs to control.

1. Go back to IAM and select Roles
2. Create a new Role
3. Chose Web Identity, select the Identity provider you created in the previous step, and its audience.
4. Click Next:Permissions

You now need to give the role the appropriate permissions (Policies). These are the ones that Github needs in order to do whatever it has to do. This will vary based on your use case, so I will leave that up to you. Keep in mind that you should stick to the principle of least privileges.

When that is done, give your role a name and click Create Role.

```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::1234567890:oidc-provider/token.actions.githubusercontent.com"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "token.actions.githubusercontent.com:aud": "sts.amazonaws.com"
        },
        "StringLike": {
          "token.actions.githubusercontent.com:sub": "repo:[your-org]/[your-repo]:*"
        }
      }
    }
  ]
}

```


## Configure Github action workflow


Once the above configurations are complete, you need to modify the GitHub Actions workflow file to include the following section:

```
- name: configure aws credentials
  uses: aws-actions/configure-aws-credentials@v1
  with:
    role-to-assume: arn:aws:iam::1234567890:role/your-role-arn
    role-duration-seconds: 900 # the ttl of the session, in seconds.
    aws-region: us-east-1 # use your region here.

```

The configure AWS credentials step will use the OIDC integration to assume the given role, generate short-lived credentials, and make them available to the current job.




## Reference
[Securely Access Your AWS Resources From Github Actions](https://benoitboure.com/securely-access-your-aws-resources-from-github-actions)

