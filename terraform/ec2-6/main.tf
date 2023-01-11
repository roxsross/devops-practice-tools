#AWS
#AMI=ami-0fe472d8a85bc7b0e
#SG= 22
#vpc= vpc-0c4286bbfc54cb66e
#Subnet=subnet-0b61716db7bd7dff6 (e)
#terraform init
#terraform validate
#terraform plan
#terraform apply -auto-approve

#generar llave publica
#mkdir keys
#ssh-keygen -q -f keys/aws_terraform -C aws_terraform_ssh_key -N ''

provider "aws" {
  region     = "${var.region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  token      = "${var.token}"
}

#DATA

data "aws_ami" "amazon" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["137112412989"] # Canonical
}

locals {
  instances_count = 1
}

#RECURSOS
resource "aws_security_group" "nginx-sg" {
  name = "${var.server}-sg"
  vpc_id = "${var.vpc_id_default}"

  ingress {
    description      = "Access SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "http"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.server}-sg"
  }
}

resource "aws_key_pair" "server_key" {
  key_name = "${var.server}_key"
  public_key = file("keys/aws_terraform.pub")
}

resource "aws_instance" "server" {
  count                  = local.instances_count
  ami                    = data.aws_ami.amazon.id
  instance_type          = "${var.type_instance_ec2}"
  subnet_id              = "${var.subnet_ec2}"
  vpc_security_group_ids = [aws_security_group.nginx-sg.id]
  key_name               = aws_key_pair.server_key.key_name
  tags = {
    Name = "nginx-server-tf"
  }
  user_data = <<EOF
#! /bin/bash
sudo amazon-linux-extras install -y nginx1
sudo service nginx start
sudo rm /usr/share/nginx/html/index.html
echo '<html><head><title>Bootcamp Terraform Server</title></head><body style=\"background-color:#1F778D\"><p style=\"text-align: center;\"><span style=\"color:#FFFFFF;\"><span style=\"font-size:28px;\">Welcome to &#127819; Bootcamp</span></span></p></body></html>' | sudo tee /usr/share/nginx/html/index.html
EOF
}
