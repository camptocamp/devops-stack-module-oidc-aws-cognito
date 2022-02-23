# devops-stack-module-oidc-aws-cognito

A [DevOps Stack](https://devops-stack.io) module to deploy and configure [AWS Cognito](https://aws.amazon.com/cognito/) as an OIDC provider.


## Usage

```hcl
resource "aws_cognito_user_pool" "pool" {
  name = var.cluster_name
}

resource "aws_cognito_user_pool_domain" "pool_domain" {
  domain       = var.cluster_name
  user_pool_id = aws_cognito_user_pool.pool.id
}

module "oidc" {
  source = "git::https://github.com/camptocamp/devops-stack-module-oidc-aws-cognito.git/"

  cluster_name     = var.cluster_name
  argocd_namespace = module.cluster.argocd_namespace
  base_domain      = module.cluster.base_domain

  cognito_user_pool_id     = aws_cognito_user_pool.pool.id
  cognito_user_pool_domain = aws_cognito_user_pool_domain.pool_domain.domain
}
```
