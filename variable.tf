
# In this file we will create variables to ise in main.tf
# variable.tf

variable "region"{
  default = "eu-west-1"
}

# Let's create a var for the name of our instance
variable "name"{
  default = "eng99_ali_app_instance"
}

# Let's create a var for our ami id
variable "app_ami_id"{
  default = "ami-07d8796a2b0f8d29c"
}

variable "app_instance_type"{
  default = "t2.micro"
}


# VPC ID
variable "vpc_id"{
  default = "vpc-033457a3332b58017"
}

# VPC ID
variable "cidr_block"{
  default = "10.0.0.0/16"
}

# Public Subnet
variable "aws_public_subnet"{
  default = "eng99_ali_terraform_public_SN"
}

# Public Subnet
variable "aws_key_name"{
  default = "eng99"
}

# #creating var for our instances
# variable "region" {
#     default = "eu-west-1"
# }


# variable "app_instance" {
#     default = "eng99_ali_terraform_app_instance"
# }

# variable "app_ami_id" {
#     default = "ami-082fbd334da28e5ec"
# }

# variable "db_instance" {
#     default = "eng99_ali_terraform_db_instance"
# }

# variable "db_ami_id" {
#     default = "ami-082fbd334da28e5ec"
# }

# variable "type_of_machine" {
#     default = "t2.micro"
# }


# variable "vpc_id" {
#     default = "vpc-07776619285e4baf5"
# }

# variable "aws_security_group" {
#     default = "sg-0840085c222a117d2"
# }

# variable "cidr_block" {
#     default = "10.0.0.0/16"
# }

# variable "aws_key_name" {
#     default = "eng99"
# }

# variable aws_internet_gateway {
#     default = "eng99_ali_terraform_igw"
# }



# variable "aws_subnet" {
#     default = "eng99_ali_terraform_public_SN"
# }

#variable "aws_public_subnet" {
#     default = "eng99_ali_terraform_private_SN"
# }
# variable "private_subnet" {
#     default = ""
# }
