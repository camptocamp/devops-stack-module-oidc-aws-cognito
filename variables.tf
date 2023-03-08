#######################
## Standard variables
#######################

variable "cluster_name" {
  description = "Name given to the cluster. Value used for the ingress' URL of the application."
  type        = string
}

variable "base_domain" {
  description = "Base domain of the cluster. Value used for the ingress of ."
  type        = string
}

variable "dependency_ids" {
  description = "IDs of the other modules on which this module depends on."
  type        = map(string)
  default     = {}
}

#######################
## Module variables
#######################

variable "create_pool" {
  description = "Boolean to activate the creation of the pool. If set as true you'll cannot pass specify the variables `cognito_user_pool_id` and `cognito_user_pool_domain`."
  type        = bool
  default     = false
}

variable "cognito_user_pool_id" {
  description = "ID of the Cognito user pool to use. If not provided, the module will create its own pool where to put the remaining created resources."
  type        = string
  default     = null
}

variable "cognito_user_pool_domain" {
  description = "Domain prefix of the Cognito user pool to use (custom domain currently not supported!). If not provided, the module will create its own pool and get its domain."
  type        = string
  default     = null
}

variable "callback_urls" {
  description = "List of URLs where the authentication server is allowed to return during the authentication flow. Will be concatenated with the default URLs pertaining to the DevOps Stack."
  type        = list(string)
  default     = []
}

variable "create_default_user" {
  description = "Boolean to activate the creation of a default user with administrative privileges, mainly for testing purposes."
  type        = bool
  default     = false
}

variable "user_map" {
  description = "List of users to be added to the default admin group. Note that all fields are mandatory. These users will be given a temporary password on their invitation e-mail, so the address needs to be valid."
  type = map(object({
    username   = string
    email      = string
    first_name = optional(string)
    last_name  = optional(string)
  }))
  default = {}
}
