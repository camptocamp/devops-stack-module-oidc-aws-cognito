#######################
## Standard variables
#######################

variable "cluster_name" {
  description = "Name given to the cluster. Value used for the ingress' URL of the application."
  type = string
}

variable "base_domain" {
  description = "Base domain of the cluster. Value used for the ingress of ."
  type = string
}

variable "dependency_ids" {
  description = "IDs of the other modules on which this module depends on."
  type = map(string)
  default = {}
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

variable "callback_urls" {
  
}
