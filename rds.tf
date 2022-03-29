# Create rds.tf file and add the below code to it
# Create RDS Instance

resource "aws_db_subnet_group" "db-subnet-group" {
  name       = "dbsubnetgroup"
  subnet_ids = [aws_subnet.database-subnet-1.id, aws_subnet.database-subnet2.id]

tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "rds" {
  db_subnet_group_name   = aws_db_subnet_group.db-subnet-group.id
  allocated_storage      = var.allocated_storage
  engine                 = var.engine_type
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  multi_az               = true
  name                   = "mydb"
  username               = "admin"
  password               = "admin"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.rds-sg.id]


}

# In the above code, you can change the value of username & password, i provided 'admin' as username and password
# multi-az is set to true for the high availability

# our next step is to ; Step 17:- Create a file for the VPC Flow Logs