variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "172.31.0.0/16"
}

variable "public_subnets" {
  default = ["172.31.1.0/24", "172.31.2.0/24", "172.31.3.0/24"]
}

variable "private_subnets" {
  default = ["172.31.4.0/24", "172.31.5.0/24", "172.31.6.0/24"]
}

variable "db_username" {
  default = "admin"
}

variable "db_password" {
  default = "MySecureDBPass123"  # Ideally use TF_VAR_db_password as env variable
}

