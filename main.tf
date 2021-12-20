resource "aws_vpc" "project-13" {
  cidr_block       = var.vpc-cidr13
  instance_tenancy = "default"

  tags = {
    Name = "project-13"
  }
}

# Public Subnet

resource "aws_subnet" "pubsub-13-1" {
  vpc_id     = aws_vpc.project-13.id
  cidr_block = var.public-subnet-13-1
  availability_zone = "eu-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "pubsub-13-1"
  }
}

resource "aws_subnet" "pubsub-13-2" {
  vpc_id     = aws_vpc.project-13.id
  cidr_block = var.public-subnet-13-2
  availability_zone = "eu-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "pubsub-13-2"
  }
}

resource "aws_subnet" "pubsub-13-3" {
  vpc_id     = aws_vpc.project-13.id
  cidr_block = var.public-subnet-13-3
  availability_zone = "eu-west-2c"
  map_public_ip_on_launch = true

  tags = {
    Name = "pubsub-13-3"
  }
}
#Private subnet

resource "aws_subnet" "privsub-13-1" {
  vpc_id     = aws_vpc.project-13.id
  cidr_block = var.private-subnet-13-1
  availability_zone = "eu-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "privsub-13-1"
  }
}


resource "aws_subnet" "privsub-13-2" {
  vpc_id     = aws_vpc.project-13.id
  cidr_block = var.private-subnet-13-2
  availability_zone = "eu-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "privsub-13-2"
  }
}


resource "aws_subnet" "privsub-13-3" {
  vpc_id     = aws_vpc.project-13.id
  cidr_block = var.private-subnet-13-3
  availability_zone = "eu-west-2c"
  map_public_ip_on_launch = true

  tags = {
    Name = "privsub-13-3"
  }
}

#Route table

resource "aws_route_table" "publicroute13" {
  vpc_id = aws_vpc.project-13.id

  tags = {
    Name = "publicroutet13"
  }
}

resource "aws_route_table" "privateroute13" {
  vpc_id = aws_vpc.project-13.id

  route = []

  tags = {
    Name = "privateroute13"
  }
}

#RT association

resource "aws_route_table_association" "pubrt-asso13-1" {
  subnet_id      = aws_subnet.pubsub-13-1.id
  route_table_id = aws_route_table.publicroute13.id
}

resource "aws_route_table_association" "pubrt-asso13-2" {
  subnet_id      = aws_subnet.pubsub-13-2.id
  route_table_id = aws_route_table.publicroute13.id
}

resource "aws_route_table_association" "pubrt-asso13-3" {
  subnet_id      = aws_subnet.pubsub-13-3.id
  route_table_id = aws_route_table.publicroute13.id
}


resource "aws_route_table_association" "privrt-asso13-1" {
  subnet_id      = aws_subnet.privsub-13-1.id
  route_table_id = aws_route_table.privateroute13.id
}

resource "aws_route_table_association" "privrt-asso13-2" {
  subnet_id      = aws_subnet.privsub-13-2.id
  route_table_id = aws_route_table.privateroute13.id
}


resource "aws_route_table_association" "privrt-asso13-3" {
  subnet_id      = aws_subnet.privsub-13-3.id
  route_table_id = aws_route_table.privateroute13.id
}
#Igw

resource "aws_internet_gateway" "igw-project-13" {
  vpc_id = aws_vpc.project-13.id

  tags = {
    Name = "igw-project-13"
  }
}

resource "aws_route" "igw-rtasso13" {
  route_table_id = aws_route_table.publicroute13.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id     = aws_internet_gateway.igw-project-13.id
}