terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

# provision security group
resource "aws_security_group" "my_security_group" {
  
  ingress {# Allows SSH traffic on port 22 from any IP address
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ] #represents all possible IPv4 addresses (with any IP address on the internet.)
  }
  ingress {# Allows HTTP traffic on port 80 from any IP address
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  egress{ #EC2 instance can send traffic to any destination IP address
    from_port = 0
    to_port = 0
    protocol = "-1" #all protocols are allowed.
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  tags = {
    Name="My-Security-Group"
  }
}
#ami-0e86e20dae9224db8 04a81a99f5ec58529
resource "aws_instance" "terraform-test" {
  ami           = "ami-0e86e20dae9224db8" # Ubuntu 24.04 LTS (us-east-1)
  instance_type = "t2.micro"
  key_name = "vockey" 
  
 # Reference the security group by its ID
  vpc_security_group_ids = [
    aws_security_group.my_security_group.id,
  ]
  tags = {
    Name = "terraform-test"
  }
}

# Output the public IP of the EC2 instance
output "instance_public_ip" {
  value = aws_instance.terraform-test.public_ip
}

# Output the public DNS of the EC2 instance
output "instance_public_dns" {
  value = aws_instance.terraform-test.public_dns
}
