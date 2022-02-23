#######################
## Standard variables
#######################

variable "cluster_name" {
  type = string
}

variable "base_domain" {
  type = string
}

variable "argocd_namespace" {
  type = string
}

variable "namespace" {
  type    = string
  default = "cert-manager"
}

#######################
## Module variables
#######################

variable "cognito_user_pool_id" {
  description = "ID of the Cognito user pool to use."
  type        = string
}

variable "cognito_user_pool_domain" {
  description = "Domain prefix of the Cognito user pool to use (custom domain currently not supported!)."
  type        = string
}
