#!/bin/bash
yum update -y
yum install httpd -y
yum install git -y
service httpd start
chkconfig httpd on

cd /var/www/html
echo "Hello!" > index.html

git clone https://github.com/roxsross/devops-practice-tools.git
cp -r devops-practice-tools/static-website/coming-soon-static-web/* /var/www/html/
