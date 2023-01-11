variable "vpc_id_default" {
    type = string
    default = ""
}

variable "type_instance_ec2" {
    type    = string
    default = "t2.micro"
}

variable "subnet_ec2" {
    type    = string
    default = ""
}

variable "access_key" {
    type = string
    default = ""
}

variable "secret_key" {
    type = string
    default = ""
}

variable "token" {
    type = string
    default = ""
}
variable "region" {
    type = string
    default = "us-east-1"
}

variable "server" {
    type = string
    default = "nginx"
}