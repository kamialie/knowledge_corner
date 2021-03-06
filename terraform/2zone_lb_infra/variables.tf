variable "private_key_path" {
  default = "terraform_pluralsight.pem"
}

variable "key_name" {
  default = "terraform_pluralsight"
}

variable "network_address_space" {
  default = "10.1.0.0/16"
}

variable "subnet1_address_space" {
  default = "10.1.0.0/24"
}

variable "subnet2_address_space" {
  default = "10.1.1.0/24"
}
