terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.5.0"
    }
  }
  required_version = ">= 0.15"
}



provider "google" {
  project = local.gcp_project
  region  = local.gcp_region
  zone    = local.gcp_zone
}