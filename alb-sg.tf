# Create ALB Security Group

resource "aws_security_group" "alb-sg" {
  name        = "vpc_alb_sg"
  description = "Allow web inbound traffic"
  vpc_id      = aws_vpc.prod-vpc.id

ingress {
    description      = "all traffic from VPC"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
tags = {
    Name = "VPCALBSG"
  }
}

# Why is application load balancer required?
# why we create application load balancer security group
# By distributing network traffic and information flows across multiple servers, a load balancer ensures no single server bears too much demand. 
# This improves application responsiveness and availability, enhances user experiences, and can protect from distributed denial-of-service (DDoS) attacks.

# next we will : Step 11:- Create a file for Security Group for the EC2's
