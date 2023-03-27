terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 3"
    }
  }
}
