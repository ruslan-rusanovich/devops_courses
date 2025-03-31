provider "aws" {
    region = "us-east-1"
}

module "string" {
  source  = "terraform-aws-modules/ssm-parameter/aws"

  name  = "ruslan_insecure_string"
  value = var.insecure_string_value
}


resource "random_password" "secret_value"{
  length           = 16
  special          = true
  override_special = "_!%^"
}

module "secret" {
  source  = "terraform-aws-modules/ssm-parameter/aws"

  name        = var.secret_name
  value       = random_password.secret_value.result
  secure_type = true
}


module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.cidr_block

  azs             = ["us-east-1a"]
  private_subnets = [var.private_subnet]
  public_subnets  = [var.public_subnet]


  tags = {
    Name = "ruslan-modules"
  }
}