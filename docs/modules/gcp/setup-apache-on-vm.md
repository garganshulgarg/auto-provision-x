<!-- BEGIN_TF_DOCS -->

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