# A launch template provides full functionality for Amazon EC2 Auto Scaling and also newer features of Amazon EC2 such as the current generation of EBS Provisioned IOPS volumes (io2),
#  EBS volume tagging, T2 Unlimited instances, Elastic Inference, and Dedicated Hosts.

# What is the difference between launch template and launch configuration?
# launch configurations are used with Auto Scaling Groups. While launch templates are used when you launch an instance using the aws EC2 console, an "AWS SDK, or a command line tool 
# Launch templates enable you to store the parameters (AMI, instance type, security groups, and key pairs etc.)"

resource "aws_launch_template" "webser-server-ec2" {
    name = "webServerEc2"

# A block device mapping defines the block devices (instance store volumes and EBS volumes) to attach to an instance. 
# You can specify a block device mapping as part of creating an AMI so that the mapping is used by all instances 
# launched from the AMI.

block_device_mappings {
  device_name = "dev/xvda"

  ebs {
      volume_size = 8
  }
}

instance_type = var.instance_type
image_id = var.image_id
user_data = filebase64("data.sh")

network_interfaces {
  associate_public_ip_address = false
  security_groups = [aws_security_group.ec2-sg.id]
  }
}
# I have used the userdata to configure the EC2 instance, I will discuss the data.sh file later in the article.

# If you changed the region from us-east-2 you need to check you have the correct “image_id” (AMI) to reflect the region you are working in. 
# It’s also good practice to check that it is the right one as AWS do often update AMI ID’s. If so this will need to be changed in the .tfvars file later on in this article.
# Our next step is : Step 10:- to Create a file for the Security Group for the ALB
