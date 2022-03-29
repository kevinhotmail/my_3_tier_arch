# this is my provider

terraform {
  required_version = ">= 1.0.0"
  
required_providers {
      aws = "3.64.0"
  }
}

provider "aws" {
  region = "us-east-2"
}