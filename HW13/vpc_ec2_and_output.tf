provider "aws" {
    region = "us-east-1"
}


resource "aws_vpc" "ruslan_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "ruslan_subnet" {
  vpc_id     = aws_vpc.ruslan_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "ruslan_subnet"
  }
}

resource "aws_security_group" "ruslan_SG" {
  vpc_id = aws_vpc.ruslan_vpc.id
  name = "ruslan_SG"
  tags = {
    Name = "ruslan_SG"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ruslan_allow_ssh" {
  security_group_id = aws_security_group.ruslan_SG.id
  from_port = 22
  to_port = 22
  ip_protocol = "tcp"
  cidr_ipv4 = "0.0.0.0/0"
  description = "allowing ssh"
}


resource "aws_instance" "ruslan_via_terraform" {
  ami = "ami-084568db4383264d4"
  instance_type = "t3.micro"
  key_name = "devops"
  subnet_id = aws_subnet.ruslan_subnet.id
  vpc_security_group_ids = [aws_security_group.ruslan_SG.id]
  associate_public_ip_address = true
  root_block_device {
    volume_type = "gp3"
    volume_size = 12
  }

  tags = {
    Name = "ruslan_via_terraform"
  }
}


output "instance_id" {
  value = aws_instance.ruslan_via_terraform.id
}
