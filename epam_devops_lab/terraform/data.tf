data "aws_ami" "ubuntu-18-04" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  /*
  filter {
    name = "root-device-type"
    values = ["instance-store"]
  }
  */

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-18.04-amd64-server-*"]
  }
}
