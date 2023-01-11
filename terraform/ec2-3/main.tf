#AWS
#AMI=ami-0fe472d8a85bc7b0e
#SG= 22
#vpc= vpc-0c4286bbfc54cb66e
#Subnet=subnet-0b61716db7bd7dff6 (e)
#terraform init
#terraform validate
#terraform plan
#terraform apply -auto-approve

provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
  token      = ""
}

#RECURSOS
resource "aws_security_group" "ec2-sg" {
  name = "ec2-sg"
  vpc_id = "vpc-0c4286bbfc54cb66e"

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
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ec2-sg"
  }
}

resource "aws_instance" "server" {
  ami           = "ami-0fe472d8a85bc7b0e"
  instance_type = "t2.micro"
  subnet_id = "subnet-0b61716db7bd7dff6"
  vpc_security_group_ids = [aws_security_group.ec2-sg.id]
  tags = {
    Name = "server-tf"
  }
}
