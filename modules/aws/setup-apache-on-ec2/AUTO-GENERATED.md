<!-- BEGIN_TF_DOCS -->

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
<!-- BEGIN\_TF\_DOCS -->

<!-- END\_TF\_DOCS -->

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_source_ranges"></a> [allowed\_source\_ranges](#input\_allowed\_source\_ranges) | Allowed IP ranges | `list(string)` | n/a | yes |
| <a name="input_required_tags"></a> [required\_tags](#input\_required\_tags) | Labels which will get added to virtual machine | `map(string)` | `{}` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | AWS EC2 Node Public IP |
<!-- END_TF_DOCS -->