provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name      = "aet vpc"
    Terraform = true
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name      = "aet subnet1"
    Terraform = true
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Terraform = true
  }
}

resource "aws_default_route_table" "main" {
  default_route_table_id = aws_vpc.main.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name      = "aet route table"
    Terraform = true
  }
}

resource "aws_security_group" "main" {
  name          = "AET Security Group"
  vpc_id        = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # any
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Terraform = true
  }
}

resource "aws_instance" "server" {
  count = 2

  ami                         = var.ubuntu_16_04_free
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  key_name                    = var.ssh_key
  subnet_id                   = aws_subnet.subnet1.id
  vpc_security_group_ids      = [aws_security_group.main.id]

  tags = {
    Name      = "server-${count.index + 1}"
    Terraform = true
  }
}

resource "aws_instance" "database" {
  count = 2

  ami                         = var.ubuntu_16_04_free
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  key_name                    = var.ssh_key
  subnet_id                   = aws_subnet.subnet1.id
  vpc_security_group_ids      = [aws_security_group.main.id]

  tags = {
    Name      = "database-${count.index + 1}"
    Terraform = true
  }
}

output "server-IPs" {
  value = aws_instance.server[*].public_ip
}

output "database-IPs" {
  value = aws_instance.database[*].public_ip
}
