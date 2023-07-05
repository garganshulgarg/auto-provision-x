resource "google_compute_instance" "setup-apache-on-vm" {
  name         = var.name
  description  = var.description
  machine_type = "e2-micro"

  labels = var.required_tags

  boot_disk {
    initialize_params {
      image  = "debian-cloud/debian-11"
      labels = var.required_tags
    }
  }
  metadata_startup_script = <<-EOT
    #!/bin/bash
    
    sudo su
    apt update 
    apt-get install -y apache2
    ls /var/www/html
    echo "Hello World!"
    echo "Hello World!" > /var/www/html/index.html
    echo $(hostname)
    echo $(hostname -i)
    echo "Hello World from $(hostname)"
    echo "Hello World from $(hostname) $(hostname -i)"
    echo "Hello world from $(hostname) $(hostname -i)" > /var/www/html/index.html
    sudo service apache2 start
  EOT

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }

  tags = ["http-server"]
}


resource "google_compute_firewall" "http_allow" {
  name    = "http-allow"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = var.allowed_source_ranges
  target_tags   = ["http-server"]
}
