provider "aws" {
    region = "us-east-1"
}

resource "random_password" "postgres_pass_value"{
  length           = 16
  special          = true
  override_special = "_!%^"
}

resource "aws_ssm_parameter" "postgres_pass" {
  name        = "postgress-password"
  type        = "SecureString"
  value       = random_password.postgres_pass_value.result

  tags = {
    name = "ruslan"
  }
}

resource "aws_ssm_parameter" "postgres_username" {
  name        = "postgress-username"
  type        = "String"
  value       = "foo"

  tags = {
    name = "ruslan"
  }
}


resource "aws_db_instance" "ruslan-db" {
  identifier           = var.db_identifier
  allocated_storage    = var.storage
  db_name              = var.db_name
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = aws_ssm_parameter.postgres_username.value
  password             = aws_ssm_parameter.postgres_pass.value
  skip_final_snapshot  = true
  apply_immediately    = true
}