module "gcp_setup-apache-on-vm" {
  source                = "git::https://github.com/garganshulgarg/auto-provision-x.git//modules/gcp/setup-apache-on-vm/?ref=gcp-setup-apache-on-vm"
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
  description = "GCP Public IP"
  value       = module.gcp_setup-apache-on-vm.public_ip
}