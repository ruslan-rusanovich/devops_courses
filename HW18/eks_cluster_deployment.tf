provider "aws" {
  region = "us-east-1"
}

data "aws_availability_zones" "available" {
    state = "available"
}

locals {
    my_tag = "ruslan"
    zone1 = data.aws_availability_zones.available.names[0]
    zone2 = data.aws_availability_zones.available.names[1]
}

resource "aws_vpc" "ruslan_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = local.my_tag
    }
}

resource "aws_internet_gateway" "ruslan_igw" {
  vpc_id = aws_vpc.ruslan_vpc.id

  tags = {
    Name = local.my_tag
  }
}

resource "aws_default_route_table" "ruslan_rt" {
  default_route_table_id = aws_vpc.ruslan_vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ruslan_igw.id
  }

  tags = {
    Name = local.my_tag
  }
}

resource "aws_subnet" "ruslan_subnet_1" {
    vpc_id = aws_vpc.ruslan_vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = local.zone1
    map_public_ip_on_launch = true
    tags = {
        Name = local.my_tag
    }
}

resource "aws_subnet" "ruslan_subnet_2" {
    vpc_id = aws_vpc.ruslan_vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = local.zone2
    map_public_ip_on_launch = true
    tags = {
        Name = local.my_tag
    }
}

module "eks" {
    source  = "terraform-aws-modules/eks/aws"
    version = "19.15.3"
    cluster_name = "${local.my_tag}-cluster"
    cluster_version = "1.32"
    vpc_id = aws_vpc.ruslan_vpc.id
    subnet_ids = [aws_subnet.ruslan_subnet_1.id, aws_subnet.ruslan_subnet_2.id]
    cluster_endpoint_public_access = true
    eks_managed_node_group_defaults = {
        ami_type = "AL2_x86_64"
    }
    eks_managed_node_groups = {
        one = {
            name = "${local.my_tag}-node-group"
            instance_types = ["t3.small"]
            min_size     = 2
            max_size     = 2
            desired_size = 2
        }
    }
}