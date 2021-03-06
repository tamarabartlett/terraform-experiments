variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_cidrs" {
  type    = list
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_cidrs" {
  type    = list
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "zones" {
  default = ["us-west-2a", "us-west-2b"]
}

variable "my_public_key" {
  default = "instances/id_rsa.pub"
}
