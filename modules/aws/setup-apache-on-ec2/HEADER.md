# Setup Apache on AWS EC2

We are attempting to provision a EC2 on Amazon Web Services (AWS) using Terraform. As part of the provisioning process, we will install Apache2 on the EC2 using Terraform. Once the installation is complete, Terraform will generate a Public IP address as an output. We can use this Public IP address to validate the successful installation of Apache2


```
module "aws_setup-apache-on-ec2" {
  source                = "git::https://github.com/garganshulgarg/auto-provision-x.git//modules/aws/setup-apache-on-ec2/?ref=main"
  allowed_source_ranges = ["0.0.0.0/0"]
  required_tags = {
    "owner"  = "garganshulgarg"
    "repo"   = "auto-provision-x"
    "sample" = "true"
  }
}


```
<!-- BEGIN_TF_DOCS -->


<!-- END_TF_DOCS -->