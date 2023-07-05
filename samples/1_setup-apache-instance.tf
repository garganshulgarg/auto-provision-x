module "gcp_setup-apache-on-vm" {
  source      = "git::https://github.com/garganshulgarg/auto-provision-x.git//modules/gcp/setup-apache-on-vm/?ref=gcp-setup-apache-on-vm"
  name        = "setup-apache-on-vm"
  description = "we are setting up apache on this GCP Virtual Machine."
  required_tags = {
    "Owner"  = "garganshulgarg"
    "Repo"   = "auto-provision-x"
    "Sample" = "true"
  }
}

