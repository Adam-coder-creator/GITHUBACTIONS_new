terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}
provider "aws" {
  region = "eu-north-1"  # Zamie? na sw¢j region
}
# Tworzenie VPC
resource "aws_vpc" "example_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "ExampleVPC"
  }
}

# Tworzenie Subnet
resource "aws_subnet" "example_subnet" {
  vpc_id            = aws_vpc.example_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-north-1a"  # Zamie? na odpowiedni? stref? dost?pno?ci

  tags = {
    Name = "ExampleSubnet"
  }
}

# Tworzenie Security Group
resource "aws_security_group" "example_sg" {
  name_prefix = "example-"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.example_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ExampleSecurityGroup"
  }
}

# Tworzenie EC2 Instance
resource "aws_instance" "example" {
  ami           = "ami-0b8fd93c15b2c81ce"  # Zamie? na odpowiednie AMI 2
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.example_subnet.id
  vpc_security_group_ids = [aws_security_group.example_sg.id]
  key_name = "New_pair"

  tags = {
    Name = "ExampleInstance"
  }
}
