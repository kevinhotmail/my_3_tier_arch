# creating internet gateway. An internet gateway is a horizontally scaled, redundant, and highly available VPC component that allows communication between your VPC and the internet.

resource "aws_internet_gate" "web-app-gateway" {
vpc_id = aws_vpc.prod-vpc.id

tags = {
    Name = "Web App Gateway"
 }
}