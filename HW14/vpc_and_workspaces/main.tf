provider "aws" {
    region = "us-east-1"
}

resource "aws_vpc" "ruslan_vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = "${terraform.workspace}-vpc"
  }
}