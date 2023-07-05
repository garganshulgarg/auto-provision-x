terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.74.1"
    }
  }
  required_version = ">= 0.15"
}

provider "aws" {
  region = local.aws_region
  tags                   = var.required_tags
}



