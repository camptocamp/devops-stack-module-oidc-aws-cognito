locals {
  cognito_user_pool_id = var.create_pool ? resource.aws_cognito_user_pool.devops_stack_user_pool[0].id : var.cognito_user_pool_id

  cognito_user_pool_domain = var.create_pool ? resource.aws_cognito_user_pool_domain.devops_stack_user_pool_domain[0].domain : var.cognito_user_pool_domain

  # TODO Discuss if we use a coalescelist() instead of the concat()
  callback_urls = distinct(concat([
    format("https://argocd.%s.%s/auth/callback", trimprefix("${var.subdomain}.${var.cluster_name}", "."), var.base_domain),
    format("https://grafana.%s.%s/login/generic_oauth", trimprefix("${var.subdomain}.${var.cluster_name}", "."), var.base_domain),
    format("https://prometheus.%s.%s/oauth2/callback", trimprefix("${var.subdomain}.${var.cluster_name}", "."), var.base_domain),
    format("https://thanos-query.%s.%s/oauth2/callback", trimprefix("${var.subdomain}.${var.cluster_name}", "."), var.base_domain),
    format("https://thanos-bucketweb.%s.%s/oauth2/callback", trimprefix("${var.subdomain}.${var.cluster_name}", "."), var.base_domain),
    format("https://alertmanager.%s.%s/oauth2/callback", trimprefix("${var.subdomain}.${var.cluster_name}", "."), var.base_domain),
  ], var.callback_urls))

  oidc = {
    issuer_url              = format("https://cognito-idp.%s.amazonaws.com/%s", data.aws_region.current.name, local.cognito_user_pool_id)
    oauth_url               = format("https://%s.auth.%s.amazoncognito.com/oauth2/authorize", local.cognito_user_pool_domain, data.aws_region.current.name)
    token_url               = format("https://%s.auth.%s.amazoncognito.com/oauth2/token", local.cognito_user_pool_domain, data.aws_region.current.name)
    api_url                 = format("https://%s.auth.%s.amazoncognito.com/oauth2/userInfo", local.cognito_user_pool_domain, data.aws_region.current.name)
    client_id               = resource.aws_cognito_user_pool_client.client.id
    client_secret           = resource.aws_cognito_user_pool_client.client.client_secret
    oauth2_proxy_extra_args = []
  }
}
