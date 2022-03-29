# creating route tables
# A route table contains a set of rules, called routes, that are used to determine where network traffic from your subnet or gateway is directed. 
# To put it simply, a route table tells network packets which way they need to go to get to their destination.

resource "aws_route_table" "public-route-table" {
    vcp_id = aws_vpc.prod-vpc.id

route {
        cidr_block = "o.o.o.o/o"
        gateway_id = aws_internet_gateway.web-app-gateway.id
    }

tags = {
    Name = "Public"
  }
}

resource "aws_route_table" "private1" {
    vpc_id = aws_vpc.prod-vcp.id

    route {
        cidr_block ="0.0.0.0/0"
        nay_gateway_id = aws_nat_gateway.gw1.id
      }

    tags = {
        Name = "Private1"
    }
}

resource "aws_route_table" "private2" {
    vpc_id = aws_vpc.prod-vcp.id

    route {
        cidr_block ="0.0.0.0/0"
        nay_gateway_id = aws_nat_gateway.gw2.id
      }

    tags = {
        Name = "Private2"
    }
}

resource "aws_route_table" "private3" {
    vpc_id = aws_vpc.prod-vcp.id

    route {
        cidr_block ="0.0.0.0/0"
        nay_gateway_id = aws_nat_gateway.gw1.id
      }

    tags = {
        Name = "Private3"
    }
}

resource "aws_route_table" "private4" {
    vpc_id = aws_vpc.prod-vcp.id

    route {
        cidr_block ="0.0.0.0/0"
        nay_gateway_id = aws_nat_gateway.gw2.id
      }

    tags = {
        Name = "Private4"
    }
}

