
resource "aws_instance" "setup-apache-on-ec2" {
  // Attached the Image Ubuntu Server 22.04 LTS (HVM), SSD Volume Type because it has ssm-agent configured by default.
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t3.micro"

  // IAM instance profile
  iam_instance_profile = aws_iam_instance_profile.setup-apache-on-ec2.name


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


  vpc_security_group_ids = [aws_security_group.setup-apache-on-ec2.id]
  tags                   = var.required_tags
}

resource "aws_security_group" "setup-apache-on-ec2" {
  name        = "setup-apache-on-ec2-security-group"
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

  tags = var.required_tags
}

resource "aws_iam_instance_profile" "setup-apache-on-ec2" {
  name = "setup-apache-on-ec2-instance-profile" # Replace with the desired name for the IAM instance profile
  role = aws_iam_role.setup-apache-on-ec2.name  # Use the name of the managed role
  tags = var.required_tags
}

resource "aws_iam_role" "setup-apache-on-ec2" {
  name               = "setup-apache-on-ec2-role" # Replace with the desired name for the IAM role
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
  tags               = var.required_tags
}

resource "aws_iam_policy_attachment" "setup-apache-on-ec2" {
  name       = "setup-apache-on-ec2-policy-attachment"
  roles      = [aws_iam_role.setup-apache-on-ec2.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  tags       = var.required_tags
}