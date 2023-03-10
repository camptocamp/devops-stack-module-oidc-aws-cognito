output "id" {
  description = "ID to pass other modules in order to refer to this module as a dependency."
  value       = resource.null_resource.this.id
}

output "oidc" {
  description = "Object containing multiple OIDC configuration values."
  value       = local.oidc
  sensitive   = true
}

output "devops_stack_admins" {
  description = "Map containing the usernames and e-mails of the created users from `var.user_map`."
  value       = var.user_map != {} ? { for key, value in var.user_map : value.username => value.email } : {}
  sensitive   = true
}
