terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3, < 5"
    }
  }
  required_version = ">= 0.13"
}