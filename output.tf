output "id" {
  description = "ID to pass other modules in order to refer to this module as a dependency."
  value       = resource.null_resource.this.id
}

output "oidc" {
  description = "Object containing multiple OIDC configuration values."
  value       = local.oidc
  sensitive   = true
}

output "default_admin_credentials" {
  description = "Map containing the credentials of devopsadmin user, if created."
  value = var.create_default_user ? {
    "${resource.aws_cognito_user.devops_stack_admin[0].username}" = "${resource.random_password.devops_stack_admin_password[0].result}"
    } : {
    "devopsadmin" = "user_not_created"
  }
  sensitive = true
}

output "devops_stack_admins" {
  description = "Map containing the usernames and e-mails of the created users from `var.user_map`."
  value       = var.user_map != {} ? { for key, value in var.user_map : value.username => value.email } : {}
}
