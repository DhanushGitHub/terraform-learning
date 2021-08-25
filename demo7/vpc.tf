resource "aws_vpc" "main" {
  cidr_block           = "10.32.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "Dhanush_VPC"
  }
}

resource "aws_subnet" "main-public-1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.32.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-1a"

  tags = {
    Name = "Dhanush_Subnet_Public_1"
  }
}

resource "aws_subnet" "main-public-2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.32.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-1b"

  tags = {
    Name = "Dhanush_Subnet_Public_2"
  }
}

resource "aws_subnet" "main-public-3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.32.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-1c"

  tags = {
    Name = "Dhanush_Subnet_Public_3"
  }
}

resource "aws_subnet" "main-private-1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.32.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-1a"

  tags = {
    Name = "Dhanush_Subnet_Private_1"
  }
}

resource "aws_subnet" "main-private-2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.32.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-1b"

  tags = {
    Name = "Dhanush_Subnet_Private_2"
  }
}

resource "aws_subnet" "main-private-3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.32.6.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-1c"

  tags = {
    Name = "Dhanush_Subnet_Private_3"
  }
}

resource "aws_internet_gateway" "main-gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Dhanush_IGW"
  }
}

resource "aws_route_table" "main-public-rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-gw.id
  }

  tags = {
    Name = "Dhanush_Public_RT"
  }
}

resource "aws_route_table_association" "main-public-1-a" {
  subnet_id      = aws_subnet.main-public-1.id
  route_table_id = aws_route_table.main-public-rt.id

}

resource "aws_route_table_association" "main-public-2-b" {
  subnet_id      = aws_subnet.main-public-2.id
  route_table_id = aws_route_table.main-public-rt.id

}

resource "aws_route_table_association" "main-public-3-c" {
  subnet_id      = aws_subnet.main-public-3.id
  route_table_id = aws_route_table.main-public-rt.id

}