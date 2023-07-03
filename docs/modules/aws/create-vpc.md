# Create VPC in AWS using terraform


Sample Code

```hcl
module "aws_create_vpc" {
    source = "git::https://github.com/garganshulgarg/auto-provision-x.git//modules/aws/create-vpc/?ref=main"
    cidr_block = "10.0.0.0/16"
}

```


--8<-- ../../../README.md