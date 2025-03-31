variable "insecure_string_value" {
    type = string
    default = "some-string-value"
}

variable "secret_name" {
    type = string
    default = "ruslan-secret"
}

variable "vpc_name" {
    type = string
    default = "ruslan-vpc"
}

variable "cidr_block" {
    type = string
    default = "10.0.0.0/16"
}

variable "private_subnet" {
    type = string
    default = "10.0.1.0/24"
}

variable "public_subnet" {
    type = string
    default = "10.0.101.0/24"
}