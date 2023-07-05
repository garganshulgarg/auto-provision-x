output "public_ip" {
  value = google_compute_instance.setup-apache-on-vm.network_interface[0].access_config[0].nat_ip
  description = "GCP Public IP"
}