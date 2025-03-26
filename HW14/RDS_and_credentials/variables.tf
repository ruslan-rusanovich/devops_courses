variable "db_identifier" {
    type = string
    default = "ruslan-db"
}

variable "storage" {
    type = number
    default = 20
}

variable "db_name" {
    type = string
    default = "ruslanDB"
}

variable "engine" {
    type = string
    default = "postgres"
}

variable "engine_version" {
    type = string
    default = "17.1"
}

variable "instance_class" {
    type = string
    default = "db.t3.micro"
}
