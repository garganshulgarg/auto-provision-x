module "gcp_setup-apache-on-vm" {
  source                = "git::https://github.com/garganshulgarg/auto-provision-x.git//modules/gcp/setup-apache-on-vm/?ref=main"
  name                  = "setup-apache-on-vm"
  description           = "we are setting up apache on this GCP Virtual Machine."
  allowed_source_ranges = ["0.0.0.0/0"]
  required_tags = {
    "owner"  = "garganshulgarg"
    "repo"   = "auto-provision-x"
    "sample" = "true"
  }
}


output "output_gcp_public_ip" {
  description = "GCP VM Public IP"
  value       = module.gcp_setup-apache-on-vm.public_ip
}


module "aws_setup-apache-on-ec2" {
  source                = "git::https://github.com/garganshulgarg/auto-provision-x.git//modules/aws/setup-apache-on-ec2/?ref=aws-setup-apache-on-ec2"
  allowed_source_ranges = ["0.0.0.0/0"]
  required_tags = {
    "owner"  = "garganshulgarg"
    "repo"   = "auto-provision-x"
    "sample" = "true"
  }
}


output "output_aws_public_ip" {
  description = "AWS EC2 Public IP"
  value       = module.aws_setup-apache-on-ec2.public_ip
}