# Create data.sh file and add the below code to it

#!/bin/bash -ex
yum -y update
yum -y install httpd php mysql php-mysql
chkconfig httpd on
service httpd start
cd /var/www/html
wget https://3tierarch.s3.us-east-2.amazonaws.com/app.tgz
tar xvfz app.tgz
chown apache:root /var/www/html/rds.conf.php


# !!! For this to work you need to change the url in the user data. In this repository you will find a .tgz file that needs to be put into an s3 bucket in your AWS account. 
# You then need to copy the Object URL from your s3 bucket. (You can find this by clicking on the object, heading to properties and you'll find it in the object overview) Paste the 
# URL in the user data file shown in the code above. You also need to make sure that the object is publicly accessible.
# The script is run the first time the instance/s are launched. It installs a web server on your EC2 instances/s, and runs an app that can be configured to point to your MySQL RDS instance. 
# After you configure your RDS instance, it will present an address book that you can edit.


# next step is Step 19:- Create a file for variables

