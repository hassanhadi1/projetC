variable "app" {
  type = string
  default = "ms"
}

variable "user" {
  type = string
  default = "hadi"
}

variable "az_a" {
  type = string
  default = "eu-west-1a"
}

variable "az_b" {
  type = string
  default = "eu-west-1b"
}

variable "MYSQL_USER" {
  type = string
  sensitive = true
}

variable "MYSQL_PASSWORD" {
  type = string
  sensitive = true
}


