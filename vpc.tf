resource "aws_vpc" "vpc" {
  cidr_block = var.vpc-cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "VPC"
  }
}

resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "IGW"
  }
}

resource "aws_subnet" "first-public-subnet" {
  cidr_block = var.first-public-subnet-cidr
  vpc_id     = aws_vpc.vpc.id
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "The First Public subnet "
  }
}

resource "aws_subnet" "second-public-subnet" {
  cidr_block = var.second-public-subnet-cidr
  vpc_id     = aws_vpc.vpc.id
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "The Second Public subnet"
  }
}

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

resource "aws_route_table_association" "first-public-subnet-route-table-association" {
  subnet_id = aws_subnet.first-public-subnet.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "second-public-subnet-route-table-association" {
  subnet_id= aws_subnet.second-public-subnet.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_subnet" "first-private-subnet" {
  cidr_block = var.first-private-subnet-cidr
  vpc_id     = aws_vpc.vpc.id
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "The First Private Subnet | App Tier "
  }
}

resource "aws_subnet" "second-private-subnet" {
  cidr_block = var.second-private-subnet-cidr
  vpc_id     = aws_vpc.vpc.id
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "The Second Private Subnet | App Tier "
  }
}

resource "aws_subnet" "third-private-subnet" {
  cidr_block = var.third-private-subnet-cidr
  vpc_id     = aws_vpc.vpc.id
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "The Third Private Subnet | Database Tier "
  }
}

resource "aws_subnet" "fourth-private-subnet" {
  cidr_block = var.fourth-private-subnet-cidr
  vpc_id     = aws_vpc.vpc.id
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "The Fourth Private Subnet | Database Tier "
  }
}
