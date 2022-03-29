#create Ec2 security group

resource "aws_security_group" "ec2-sg" {
  name        = "ec2sg"
  description = "Allows ALB to access the EC2 instances"
  vpc_id      = aws_vpc.prod-vpc.id
  
ingress {
    description      = "TLS from ALB"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_groups  = [aws_security_group.alb-sg.id] 
  }
ingress {
    description      = "TLS from ALB"
    from_port        = 8443
    to_port          = 8443
    protocol         = "tcp"
    security_groups  = [aws_security_group.alb-sg.id]
    
  }
egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
tags = {
    Name = "VPCEC2SG"
  }
}


# I have opened ports 80 & 8443 for the inbound connection from the ALB and I have opened all the ports for the outbound connection.

# What is the purpose of AWS security groups?
# A security group acts as a virtual firewall for your EC2 instances to control incoming and outgoing traffic. 
# Inbound rules control the incoming traffic to your instance, and outbound rules control the outgoing traffic from your instance. 
# When you launch an instance, you can specify one or more security groups.

# next we need to create ; Step 12:- Creating a file for Security Group for the Database tier