# Elastic IP address is a reserved public IP address that you can assign to any EC2 instance in a particular region, until you choose to release it.
# By using an Elastic IP address, you can mask the failure of an instance or software by rapidly remapping the address to another instance in your account.

resource "aws_eip" "nat1" {

depends_on = [aws_internet_gateway.web-app-gateway]
  
  
}

resource "aws_eip" "nat2" {

depends_on = [aws_internet_gateway.web-app-gateway]
  
}