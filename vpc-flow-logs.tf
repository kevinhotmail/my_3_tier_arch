# Create vpc-flow-logs.tf file and add the below code to it

# VPC Flow Logs records a sample of network flows sent from and received by VM instances, including instances used as Google Kubernetes Engine nodes.
# These logs can be used for network monitoring, forensics, real-time security analysis, and expense optimization. 
 
resource "aws_flow_log" "flow-log-test" {
  log_destination      = aws_s3_bucket.KEVIN.arn
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = aws_vpc.prod-vpc.id
}
resource "aws_s3_bucket" "YOURNAME" {
  bucket = "KEVIN"
}

# You need to choose your own name for your bucket. And put the same name in all the fields shown above where I have put (YOURNAME).

# Step 18:- Create a file for User Data