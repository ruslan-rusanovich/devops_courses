provider "aws" {
    region = "us-east-1"
}

data "aws_security_group" "existing_SGs" {
    filter {
        name = "description"
        values = ["launch-wizard-1 *"]
    }
}

output "SG_id" {
  value = data.aws_security_group.existing_SGs.id
}