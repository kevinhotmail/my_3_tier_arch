# A terraform. tfvars file is used to set the actual values of the variables. 
# You could set default values for all your variables and not use tfvars files at all.

# What is the difference between Tfvars and variables TF?
# These two files are similar but are not same. Syntactically speaking, a variables.tf file is used to define the variables type and optionally set a default value. 
# A terraform. tfvars file is used to set the actual values of the variables.

region = "us-east-2"
image_id = "ami-064ff912f78e3e561"
subnet_prefix = [{cidr_block = "10.0.1.0/24", name = "Web_Subnet_1"}, {cidr_block = "10.0.2.0/24", name = "Web_Subnet_2"}, 
{cidr_block = "10.0.11.0/24", name = "App_Subnet_1"}, {cidr_block = "10.0.12.0/24", name = "App_Subnet_2"},
{cidr_block = "10.0.13.0/24", name = "Database_subnet_1"}, {cidr_block = "10.0.14.0/24", name = "Databse_Subnet_2"}]
allocated_storage = 10
engine_type = "mysql"
engine_version = "5.7.31"
instance_class = "db.t3.micro"


# If you changed the Region, then you need to retrospectively change the AMI ID to reflect that change. This needs to be changed in the code above.
# Now we have all the files needed to create our infrastructure and application. All we need to do is run it!
# Once you have configured your AWS credentials then follow these steps.

# In your terminal run these commands in order…
# terraform init to initialise the working directory and download the plugins of the provider
# terraform plan is to create the execution plan for our code
# terraform apply is to create the actual infrastructure.