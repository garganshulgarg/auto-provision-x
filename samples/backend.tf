terraform {
  backend "s3" {
    bucket         = "auto-provision-x"
    key            = "terraform-state/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
  }
}
