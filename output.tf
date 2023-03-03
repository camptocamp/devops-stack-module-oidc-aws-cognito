output "id" {
  value = resource.null_resource.this.id
}

output "oidc" {
  value = local.oidc
}
