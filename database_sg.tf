# Create Database Security Group

resource "aws_security_group" "rds-sg" {
  name        = "RDSSG"
  description = "Allows application to access the RDS instances"
  vpc_id      = aws_vpc.prod-vpc.id

ingress {
    description      = "EC2 to MYSQL"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups  = [aws_security_group.ec2-sg.id]
  }

egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

tags = {
    Name = "RDSSG"
  }
}

# I have opened port 3306 for the inbound connection and I have opened all the ports for the outbound connection.
# next we will ; Step 13:- Create a file Application Load Balancer