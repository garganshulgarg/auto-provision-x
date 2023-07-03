# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = var.cidr_block
}