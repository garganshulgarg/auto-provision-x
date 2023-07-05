
resource "aws_instance" "setup-apache-on-ec2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"



  user_data = <<-EOT
   #!/bin/bash
    
   sudo su
   apt update 
   apt-get install -y apache2
   ls /var/www/html
   echo "Hello World!"
   echo "Hello World!" > /var/www/html/index.html
   echo $(hostname)
   echo $(hostname -i)
   echo "Hello World from $(hostname)"
   echo "Hello World from $(hostname) $(hostname -i)"
   echo "Hello world from $(hostname) $(hostname -i)" > /var/www/html/index.html
   sudo service apache2 start
  EOT

  tags                   = var.required_tags
  vpc_security_group_ids = [aws_security_group.setup-apache-on-ec2.id]
}

resource "aws_security_group" "setup-apache-on-ec2" {
  name        = "security-group"
  description = "Security group for inbound access to the node"


  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.allowed_source_ranges
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.allowed_source_ranges
  }

  // Add more ingress rules as needed

  // Egress rules can also be defined if necessary
}


data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}