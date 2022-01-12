#creating var for our instances
variable "region" {
    default = "eu-west-1"
}


variable "app_instance" {
    default = "eng99_ali_terraform_app_instance"
}

variable "app_ami_id" {
    default = "ami-082fbd334da28e5ec"
}

variable "db_instance" {
    default = "eng99_ali_terraform_db_instance"
}

variable "db_ami_id" {
    default = "ami-082fbd334da28e5ec"
}

variable "type_of_machine" {
    default = "t2.micro"
}


variable "vpc_id" {
    default = "vpc-07776619285e4baf5"
}

variable "aws_security_group" {
    default = "sg-0840085c222a117d2"
}

variable "cidr_block" {
    default = "10.0.0.0/16"
}

variable "aws_key_name" {
    default = "eng99"
}

variable aws_internet_gateway {
    default = "eng99_ali_terraform_igw"
}



variable "aws_subnet" {
    default = "eng99_ali_terraform_public_SN"
}

#variable "aws_public_subnet" {
#     default = "eng99_ali_terraform_private_SN"
# }
# variable "private_subnet" {
#     default = ""
# }
