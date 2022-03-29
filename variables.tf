# Terraform variables allow you to write configuration that is flexible and easier to re-use. Add a variable to define the instance name. 
# Example we can Create a new file called variables.tf with a block defining a new instance_name variable. 
# Note: Terraform loads all files in the current directory ending in

variable "region" {
     type = string
     description = "The AWS region."
   }

variable "instance_type" {
     type = string
     description = "The instance type."
     default = "t2.small"
}

variable "image_id" {
  description = "the ami"
}

variable "subnet_prefix" {
  description = "cidr block for the subnet"
}

variable "vpc_cidr" {
    description = "cidr block for vpc"
    default = "10.0.0.0/16"
}

variable "allocated_storage" {
    type = number
    description = "The allocated storage for rds"
}

variable "engine_type" {
    type = string
    description = "Engine for the RDS Instance"
}

variable "engine_version" {
    description = "Engine version for the RDS engine type"
}

variable "instance_class" {
    type = string
    description = "The instance class for the RDS instance"
}

# Variables are really helpful in terraform…Variables let you customise aspects of Terraform modules without altering the module’s own source code. 
# This allows you to share modules across different Terraform configurations, making your module composable and reusable. DRY!

# next is Step 20:- Create a file for tfvars