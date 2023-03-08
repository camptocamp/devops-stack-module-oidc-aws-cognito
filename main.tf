resource "null_resource" "dependencies" {
  triggers = var.dependency_ids
}

resource "aws_cognito_user_pool" "devops_stack_user_pool" {
  count = var.create_pool ? 1 : 0

  name = "${var.cluster_name}-pool"

  admin_create_user_config {
    allow_admin_create_user_only = true
  }

  depends_on = [
    null_resource.dependencies,
  ]
}

resource "aws_cognito_user_pool_domain" "devops_stack_user_pool_domain" {
  count = var.create_pool ? 1 : 0

  domain       = var.cluster_name
  user_pool_id = local.cognito_user_pool_id

  depends_on = [
    null_resource.dependencies,
  ]
}

resource "aws_cognito_user_group" "devops_stack_admin_group" {
  name         = "devops-stack-admins"
  user_pool_id = local.cognito_user_pool_id
  description  = "Users with administrator access to the applications on the cluster ${var.cluster_name}."

  depends_on = [
    null_resource.dependencies,
  ]
}

resource "aws_cognito_user" "devops_stack_users" {
  for_each = var.user_map

  user_pool_id = local.cognito_user_pool_id

  desired_delivery_mediums = ["EMAIL"]

  username = each.value.username
  attributes = {
    given_name     = each.value.first_name
    family_name    = each.value.last_name
    email          = each.value.email
    email_verified = true
  }
}

resource "aws_cognito_user_in_group" "devops_stack_users" {
  for_each = var.user_map

  user_pool_id = local.cognito_user_pool_id
  group_name   = resource.aws_cognito_user_group.devops_stack_admin_group.name
  username     = resource.aws_cognito_user.devops_stack_users[each.key].username
}

resource "aws_cognito_user_pool_client" "client" {
  name = format("client-%s", var.cluster_name)

  user_pool_id = local.cognito_user_pool_id

  allowed_oauth_flows = [
    "code",
  ]

  allowed_oauth_scopes = [
    "email",
    "openid",
    "profile",
  ]

  supported_identity_providers = [
    "COGNITO",
  ]

  generate_secret = true

  allowed_oauth_flows_user_pool_client = true

  callback_urls = local.callback_urls
}

data "aws_region" "current" {}

resource "null_resource" "this" {
  depends_on = [
    resource.aws_cognito_user_pool_client.client,
  ]
}
