# VPC
resource "aws_vpc" "myvpc2" {
  cidr_block = "192.168.0.0/16"

  tags = {
    Name = "myvpc2"
  }
}

# subnet
resource "aws_subnet" "myvpc2-public-subnet-1a" {
  vpc_id     = aws_vpc.myvpc2.id
  cidr_block = "192.168.0.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "myvpc2-public-subnet-1a"
  }
}
resource "aws_subnet" "myvpc2-public-subnet-1c" {
  vpc_id     = aws_vpc.myvpc2.id
  cidr_block = "192.168.1.0/24"
  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "myvpc2-public-subnet-1c"
  }
}

# インターネットゲートウェイ
resource "aws_internet_gateway" "myvpc2-igw" {
  vpc_id = aws_vpc.myvpc2.id

  tags = {
    Name = "myvpc2-igw"
  }
}

# ルートテーブル
resource "aws_route_table" "myvpc2-public-subnet-rt" {
  vpc_id = aws_vpc.myvpc2.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myvpc2-igw.id
  }
}

resource "aws_route_table_association" "route-association-myvpc2-public-subnet-1a" {
  subnet_id      = aws_subnet.myvpc2-public-subnet-1a.id
  route_table_id = aws_route_table.myvpc2-public-subnet-rt.id
}

resource "aws_route_table_association" "route-association-myvpc2-public-subnet-1c" {
  subnet_id      = aws_subnet.myvpc2-public-subnet-1c.id
  route_table_id = aws_route_table.myvpc2-public-subnet-rt.id
}
