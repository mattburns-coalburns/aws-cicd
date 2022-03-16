# --- ./providers.tf --- 

# Provides configuration details for Terraform
terraform {
  required_version = "~>1.1.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.5.0"
    }
  }
}

# Provides configuration details for the AWS Terraform provider. 
provider "aws" {
  region = "us-east-1"
}