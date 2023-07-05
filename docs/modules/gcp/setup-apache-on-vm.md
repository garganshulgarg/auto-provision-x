<!-- BEGIN_TF_DOCS -->

# Setup Apache on GCP VM

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
<!-- BEGIN\_TF\_DOCS -->

<!-- END\_TF\_DOCS -->

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_source_ranges"></a> [allowed\_source\_ranges](#input\_allowed\_source\_ranges) | Allowed IP ranges | `list(string)` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Description of the GCP Virtual Machine | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the GCP Virtual Machine | `string` | n/a | yes |
| <a name="input_required_tags"></a> [required\_tags](#input\_required\_tags) | Labels which will get added to virtual machine | `map(string)` | `{}` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | n/a |
<!-- END_TF_DOCS -->