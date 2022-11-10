#!/bin/bash
yum update -y

yum install -y mariadb-server

systemctl enable mariadb
systemctl start  mariadb 


#-----------------
# Para ejecutar desde el Bastión (no desde el user data)
# - Las password están expuestas, obviamente es para lab de pruebas

export MY_DATABASE=wordpress
export MY_DATABASE_USER=UserDB
export MY_DATABASE_PASS=UserPass
export MY_HOST='%'
# export MY_HOST=localhost

commands="CREATE DATABASE \`${MY_DATABASE}\`; \
CREATE USER '${MY_DATABASE_USER}'@'${MY_HOST}' IDENTIFIED BY '${MY_DATABASE_PASS}'; \
GRANT USAGE ON *.* TO '${MY_DATABASE_USER}'@'${MY_HOST}' IDENTIFIED BY '${MY_DATABASE_PASS}'; \
GRANT ALL privileges ON \`${MY_DATABASE}\`.* TO '${MY_DATABASE_USER}'@'${MY_HOST}'; \
FLUSH PRIVILEGES; \
"

echo "${commands}" | /usr/bin/mysql -u root -p


#-----------------
# Validacion de la Base de Datos LOCAL:
#   - Si seteamos: export MY_HOST='%'
#   - Desde local  con root
#   - Desde Remoto con $MY_DATABASE_USER y la IP privada
#
mysql ${MY_DATABASE} -u root -p
mysql ${MY_DATABASE} -u ${MY_DATABASE_USER} -h <PRIVATE_DB_IP> -p





#--------------------------------------
# Comandos útiles ingreso por Bastion
#
# 
# - $ eval `ssh-agent -s`
# - $ ssh-add -K lab-vpc.pem 
# - $ ssh -A user-ec2@ip-public-bastion
# - $ ssh    user-ec2@ip-private-db
# 
# - $ evn | grep MY
#



#--------------------------------------
# Alamcenar las varaibles User & Pass en AWS SSM 
#   - Necesita Credenciales desde IAM
#
# - $ yum install -y jq
#
# export PARAM_MY_DATABASE_PASS=$(aws ssm get-parameter --name "PARAM_MY_DATABASE_PASS" | jq -r .Parameter.Value)
#
# To make the installation secure
# - $ mysql_secure_installation



#-----------------
# Esto en realidad no lo necesito con mi lab de VPC
# es un paso menos
#-----------------
# Validacion de la Base de Datos REMOTA
# Y Permitir acceso remoto (Desde Bastión y WebServer)
#
#   sudo vim  /etc/my.cnf
#
#        [mysqld]
#        bind-address = 0.0.0.0
#
#   sudo systemctl restart  mariadb 
#
#   mysql ${MY_DATABASE} -u ${MY_DATABASE_USER} -p