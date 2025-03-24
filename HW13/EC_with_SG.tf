provider "aws" {
    region = "us-east-1"
}


resource "aws_security_group" "ruslan_SG" {
  name = "ruslan_SG"
  tags = {
    Name = "ruslan_SG"
  }
}


resource "aws_vpc_security_group_ingress_rule" "allow_tcp_to_port_8080" {
  security_group_id = aws_security_group.ruslan_SG.id
  from_port = 8080
  to_port = 8080
  ip_protocol = "tcp"
  cidr_ipv4 = "0.0.0.0/0"
  description = "allowing ssh from other port"
}

resource "aws_instance" "ruslan_via_terraform" {
  ami = "ami-084568db4383264d4"
  instance_type = "t3.micro"
  key_name = "devops"
  subnet_id = "subnet-08091e34ba8747d07"
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
