# A public subnet is a subnet that's associated with a route table that has a route to an internet gateway. 
# A private subnet with a size /24 IPv4 CIDR block (example: 10.0. 1.0/24). This provides 256 private IPv4 addresses.
# If a subnet is associated with a route table that has a route to an internet gateway, it's known as a public subnet. 
# If a subnet is associated with a route table that does not have a route to an internet gateway, it's known as a private subnet.


# Creating 1st web subnet
resource "aws_subnet" "public-subnet-1" {
    vcp_id = aws_vpc.prod-vpc.id
    cidr_block = var.subnet_prefix[0].cidr_block
    map_public_ip_on_launch = true
    availability_zone = "us-east-2a"

    tags = {
        Name = var.subnet_prefix[0].name
    }
}


# creating 2nd web server
resource "aws_subnet" "public-subnet-2" {
    vpc_id = aws_vpc.prod-vpc.id
    cidr_block = var.subnet_prefix[1].cidr_block
    map_public_ip_on_launch = true
    availability_zone = "us-east-2b"

    tags = {
        Name = var.subnet_prefix[1].name
    }
}


# Creating 1st application subnet
resource "aws_subnet" "application-subnet-1" {
    vpc_id = aws_vpc.prod-vpc.id
    cidr_block = var.subnet_prefix[2].cidr_block
    map_public_ip_on_launch = false
    availability_zone = "us-east-2a"

    tags = {
        Name = var.subnet_prefix[2].name
    }
}

# Creating 2nd application subnet 
resource "aws_subnet" "application-subnet-2" {
    vpc_id = aws_vpc.prod-vpc.id
    cidr_block = var.subnet_prefix[3].cidr_block
    map_public_ip_on_launch = false
    availability_zone = "us-east-2b"

    tags = {
        Name = var.subnet_prefix[3].name
    }
}

# 1st database private subnet
resource "aws_subnet" "database-subnet-1" {
  vpc_id     = aws_vpc.prod-vpc.id
  cidr_block = var.subnet_prefix[4].cidr_block
  availability_zone = "us-east-2a"

tags = {
    Name = var.subnet_prefix[4].name
  }
}


#2nd database private subnet
resource "aws_subnet" "database-subnet-2" {
  vpc_id     = aws_vpc.prod-vpc.id
  cidr_block = var.subnet_prefix[5].cidr_block
  availability_zone = "us-east-2b"

tags = {
    Name = var.subnet_prefix[5].name
  }
}


