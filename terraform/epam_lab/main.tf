provider "aws" {
  # access and secret key via environment variables
  # AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY
  region = var.region
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name      = "LEMP vpc"
    Terraform = true
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name      = "LEMP subnet1"
    Terraform = true
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name      = "LEMP gateway"
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
    Name      = "LEMP route table"
    Terraform = true
  }
}

resource "aws_security_group" "database" {
  name   = "LEMP admin"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.subnet1.cidr_block]
  }

  ingress {
    from_port   = 8
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [aws_subnet.subnet1.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # any
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name      = "LEMP database"
    Terraform = true
  }
}

resource "aws_security_group" "server" {
  name   = "LEMP http"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

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
    Name      = "LEMP server"
    Terraform = true
  }
}

resource "aws_instance" "server" {
  ami                         = var.ubuntu_18_04_free
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  key_name                    = var.ssh_key
  subnet_id                   = aws_subnet.subnet1.id
  vpc_security_group_ids      = [aws_security_group.server.id]

  tags = {
    Name      = "LEMP server"
    Terraform = true
  }
}

resource "aws_instance" "database" {
  ami                         = var.ubuntu_18_04_free
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  key_name                    = var.ssh_key
  subnet_id                   = aws_subnet.subnet1.id
  vpc_security_group_ids      = [aws_security_group.database.id]

  tags = {
    Name      = "LEMP database"
    Terraform = true
  }
}
