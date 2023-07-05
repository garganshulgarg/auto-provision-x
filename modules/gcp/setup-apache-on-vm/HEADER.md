<!-- BEGIN_TF_DOCS -->

We are attempting to provision a virtual machine (VM) on Google Cloud Platform (GCP) using Terraform. As part of the provisioning process, we will install Apache2 on the VM using Terraform. Once the installation is complete, Terraform will generate a Public IP address as an output. We can use this Public IP address to validate the successful installation of Apache2



```
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


```

<!-- END_TF_DOCS -->