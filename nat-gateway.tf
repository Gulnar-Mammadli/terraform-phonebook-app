resource "aws_eip" "eip-for-nat-gateway-1" {
  vpc = true

  tags ={
    Name = "EIP 1"
  }
}

resource "aws_eip" "eip-for-nat-gateway-2" {
  vpc = true

  tags ={
    Name = "EIP 2"
  }
}

resource "aws_nat_gateway" "nat-gateway-1" {
  subnet_id = aws_subnet.first-public-subnet.id
  allocation_id = aws_eip.eip-for-nat-gateway-1.id

  tags = {
    Name = "Nat Gateway Public Subnet 1"
  }
}

resource "aws_nat_gateway" "nat-gateway-2" {
  subnet_id = aws_subnet.second-public-subnet.id
  allocation_id = aws_eip.eip-for-nat-gateway-2.id

  tags = {
    Name = "Nat Gateway Public Subnet 2"
  }
}

resource "aws_route_table" "private-route-table-1" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gateway-1.id
  }

  tags = {
    Name = "Private Route Table 1"
  }
}

resource "aws_route_table_association" "first-private-subnet-route-table-association" {
  route_table_id = aws_route_table.private-route-table-1.id
  subnet_id = aws_subnet.first-private-subnet.id
}

resource "aws_route_table_association" "third-private-subnet-route-table-association" {
  route_table_id = aws_route_table.private-route-table-1.id
  subnet_id = aws_subnet.third-private-subnet.id
}

resource "aws_route_table" "private-route-table-2" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gateway-2.id
  }

  tags = {
    Name = "Private Route Table 2"
  }
}

resource "aws_route_table_association" "second-private-subnet-route-table-association" {
  route_table_id = aws_route_table.private-route-table-2.id
  subnet_id = aws_subnet.second-private-subnet.id
}

resource "aws_route_table_association" "fourth-private-subnet-route-table-association" {
  route_table_id = aws_route_table.private-route-table-2.id
  subnet_id = aws_subnet.fourth-private-subnet.id
}