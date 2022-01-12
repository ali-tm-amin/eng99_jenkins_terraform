# # apply DRY  do not repeat yourself
# # AWS plugins/dependencies will be downloaded
# provider "aws"{
#   region = var.region
#   # Allow TF to create services in Ireland

# }

# # Let's start with launching an EC2 instance using TF
# resource "aws_instance" "app_instance" {
#   ami = var.app_ami_id
#   instance_type = var.app_instance_type
#   # Enable public IP
#   associate_public_ip_address = true
#   # added eng99.pem so one can ssh
#   # Ensure we have this key in the .ssh folder
#   key_name = var.aws_key_name
#   tags = {
#     Name = "eng99_ali_terraform_app"
#   }
# }

# resource "aws_instance" "db_instance" {
#   ami = var.app_ami_id
#   instance_type = var.app_instance_type
#   # Enable public IP
#   associate_public_ip_address = false
#   # added eng99.pem so one can ssh
#   # Ensure we have this key in the .ssh folder
#   key_name = var.aws_key_name
#   tags = {
#     Name = "eng99_ali_terraform_db"
#   }
# }

# resource "aws_vpc" "eng99_ali_terraform_VPC"{
#   cidr_block = var.cidr_block

#   tags = {
#     Name = "eng99_ali_terraform_VPC"
#   }
# }

# resource "aws_subnet" "eng99_ali_terraform_public_SN" {
#   vpc_id     = aws_vpc.eng99_ali_terraform_VPC.id
#   cidr_block = "10.0.1.0/24"
#   map_public_ip_on_launch = true
#   availability_zone = "eu-west-1a"

#   tags = {
#     Name = "eng99_ali_terraform_public_SN"
#   }
# }

# resource "aws_internet_gateway" "eng99_ali_terraform_igw" {
#   vpc_id = aws_vpc.eng99_ali_terraform_VPC.id

#   tags = {
#     Name = "eng99_ali_terraform_igw"
#   }
# }

# resource "aws_route_table" "eng99_ali_terraform_rt" {
#   vpc_id = aws_vpc.eng99_ali_terraform_VPC.id

#   route  {
#       cidr_block = "0.0.0.0/0"
#       gateway_id = aws_internet_gateway.eng99_ali_terraform_igw.id
#     }

#   tags = {
#     Name = "eng99_ali_terraform_rt"
#   }
# }

# resource "aws_route_table_association" "eng99_ali_terraform_subnet_associate" {
#   route_table_id = aws_route_table.eng99_ali_terraform_rt.id
#   subnet_id = aws_subnet.eng99_ali_terraform_public_SN.id
# }

# resource "aws_security_group" "allow_tls" {
#   name        = "allow_tls"
#   description = "Allow TLS inbound traffic"
#   vpc_id      = aws_vpc.eng99_ali_terraform_VPC.id

#   ingress {
#     description      = "Allow public access"
#     from_port        = 3000
#     to_port          = 3000
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

#   ingress {
#     description      = "ssh public access UNSECURE"
#     from_port        = 22
#     to_port          = 22
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

#   ingress {
#     description      = "ENTER THROUGH ANYWHERE VERY UNSECURE!!!!!"
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1" # allow all
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

#   tags = {
#     Name = "allow_tls"
#   }
# }

provider "aws" {
    region = var.region
    # This will allow terraform to create services on eu-west-1
    # Lets start with launching ec2 instance using terraform script
}

resource "aws_instance" "app_instance" {
  # Add the ami id for 18.06LTS
  ami = var.app_ami_id
  instance_type = var.type_of_machine
  #vpc_security_group_ids = ["sg-0840085c222a117d2"]
  #subnet_id              = "subnet-0a9f2eb7a31d6e2cd"
  # Enable IP as it's our app instance
  associate_public_ip_address = true
  
  # add tags for Name
  tags = {
    Name = var.app_instance
  }
  key_name = var.aws_key_name # ensure that we have this key in .ssh folder
}
 resource "aws_instance" "db_instance" {
   # Add the ami id for 18.06LTS
   ami = var.db_ami_id
   instance_type = var.type_of_machine
   #subnet_id = var.private_subnet
   #vpc_security_group_ids = ["sg-0840085c222a117d2"]
   #subnet_id              = "subnet-0a9f2eb7a31d6e2cd"
   # Enable IP as it's our app instance
   associate_public_ip_address = true
   # add tags for Name
   tags = {
     Name = var.db_instance
     }
   key_name = var.aws_key_name # ensure that we have this key in .ssh folder
 }

resource "aws_vpc" "eng99_ali_terraform_VPC" {
  cidr_block = var.cidr_block
 
  tags = {
    Name = "eng99_ali_terraform_VPC"
  }
}

resource "aws_subnet" "eng99_ali_terraform_public_SN" {
  vpc_id     = aws_vpc.eng99_ali_terraform_VPC.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "eu-west-1a"

  tags = {
    Name = "eng99_ali_terraform_public_SN"
  }
}
# resource "aws_subnet" "eng99_ali_terraform_private_SN" {
#   vpc_id     = aws_vpc.eng99_ali_terraform_VPC.id
#   cidr_block = "10.0.2.0/24"
#   map_public_ip_on_launch = false
#   availability_zone = "eu-west-1a"

#   tags = {
#     Name = "eng99_ali_terraform_private_SN"
#   }
# }

 resource "aws_internet_gateway" "eng99_ali_terraform_igw" {
   vpc_id = aws_vpc.eng99_ali_terraform_VPC.id

   tags = {
     Name = "eng99_ali_terraform_igw"
   }
 }

 resource "aws_route_table" "eng99_ali_terraform_rt" {
   vpc_id = aws_vpc.eng99_ali_terraform_VPC.id

   route  {
       cidr_block = "0.0.0.0/0"
       gateway_id = aws_internet_gateway.eng99_ali_terraform_igw.id
     }

   tags = {
     Name = "eng99_ali_terraform_rt"
   }
 }

resource "aws_route_table_association" "eng99_ali_terraform_subnet_associate" {
   route_table_id = aws_route_table.eng99_ali_terraform_rt.id
   subnet_id = aws_subnet.eng99_ali_terraform_public_SN.id
 }

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id = var.vpc_id
  
  ingress {
    description      = "access to the app"
    from_port        = "80"
    to_port          = "80"
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
  # ssh access
  ingress {
    description      = "ssh access"
    from_port        = "22"
    to_port          = "22"
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   
  }
 # Allow port 3000 from anywhere
  ingress {
    from_port        = "3000"
    to_port          = "3000"
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
   ingress {
    description      = "ENTER THROUGH ANYWHERE VERY UNSECURE!!!!!"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

 # Outbound rules
 
egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # Allow all
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}  
