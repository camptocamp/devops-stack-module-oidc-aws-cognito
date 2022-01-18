locals {
  oidc = {
    issuer_url              = format("https://cognito-idp.%s.amazonaws.com/%s", data.aws_region.current.name, var.cognito_user_pool_id)
    oauth_url               = format("https://%s.auth.%s.amazoncognito.com/oauth2/authorize", var.cognito_user_pool_domain, data.aws_region.current.name)
    token_url               = format("https://%s.auth.%s.amazoncognito.com/oauth2/token", var.cognito_user_pool_domain, data.aws_region.current.name)
    api_url                 = format("https://%s.auth.%s.amazoncognito.com/oauth2/userInfo", var.cognito_user_pool_domain, data.aws_region.current.name)
    client_id               = aws_cognito_user_pool_client.client.id
    client_secret           = aws_cognito_user_pool_client.client.client_secret
    oauth2_proxy_extra_args = []
  }
}
