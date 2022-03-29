# NAT Gateway is a highly available AWS managed service that makes it easy to connect to the Internet from instances within a private subnet in an Amazon Virtual Private Cloud (Amazon VPC). 
# Previously, you needed to launch a NAT instance to enable NAT for instances in a private subnet.
# difference b/t nat gayeway and intenet gateway -> NAT device forwards traffic from the instances in the private subnet to the internet or other AWS services, and then sends 
# the response back to the instances while Internet Gateway is used to allow resources in your VPC to access internet.

resource "aws_nat_gateway" "gw1" {
  allocation_id = aws_eip.nat1.id
  subnet_id     = aws_subnet.public-subnet-1.id
  depends_on = [aws_internet_gateway.web-app-gateway]
}

resource "aws_nat_gateway" "gw2" {
  allocation_id = aws_eip.nat2.id
  subnet_id     = aws_subnet.public-subnet-2.id
  depends_on = [aws_internet_gateway.web-app-gateway]
}