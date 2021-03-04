variable "region" {
  type    = string
  default = "eu-central-1"
}

variable "ubuntu_20_04_free" {
  type    = string
  default = "ami-0932440befd74cdba"
}

variable "ssh_key" {
  type    = string
  default = "epam_learning"
}

variable "tags" {
  type = map(string)
  default = {
    Project   = "epam-learning-devops"
    Terraform = "true"
  }
}
