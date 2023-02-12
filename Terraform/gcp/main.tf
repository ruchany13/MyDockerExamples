terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.47.0"
    }
  }
}

provider "google" {
  credentials = file("/Users/ruchanyalcin/Garbage/Secret/secure-gizmo-372511-815c1ccd3401.json")

  project = "secure-gizmo-372511"
  region  = "europe-west3"
  zone    = "europe-west3-c"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

# resource "google_compute_disk" "default" {
#   name = "disk-data"
#   type = "pd-standard"
#   zone = "europe-west3-c"
#   size = "50"
# }

resource "google_compute_instance" "vm_instance_2" {
  name         = "terraform-instance3"
  machine_type = "e2-medium"
  zone         = "europe-west3-c"


  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts" 
      size  = "30"
    } 
    }
    # attached_disk{
    #   source      = google_compute_disk.default.id
    #   device_name = google_compute_disk.default.name
    # }


  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}
resource "google_compute_firewall" "ssh" {
  name = "allow-ssh"
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = google_compute_network.vpc_network.id
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
}