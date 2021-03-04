variable "region" {
  type    = string
  default = "eu-central-1"
}

variable "ubuntu_18_04_free" {
  type    = string
  default = "ami-0093cac2bf998a669"
}

variable "ssh_key" {
  type    = string
  default = "epam_learning"
}
