terraform {
  required_version = "~> 1.14"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.35"
    }
  }

  backend "s3" {
    bucket         = "two-tier-webapp-bucket"
    key            = "two-tier-webapp/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "tf-state-lock-table"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}