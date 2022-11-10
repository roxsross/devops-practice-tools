#!/bin/bash
yum update -y
yum install httpd -y
yum install git -y
service httpd start
chkconfig httpd on

cd /var/www/html
echo "Hello!" > index.html

git clone https://github.com/roxsross/devops-practice-tools.git
unzip static-website/coming-soon-static-web/coming-soon-static-web.zip
cp -r coming-soon-static-web/* /var/www/html/
