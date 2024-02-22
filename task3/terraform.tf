provider "google" {
  project = "${var.project_id}"
  credentials = file("/etc/creds.json")
  region = "${var.region}"
  zone = var.zone
}

resource "google_compute_instance" "client_instance" {
  name = "${var.client_name}"
  deletion_protection = false
  machine_type = "${var.machine_type}"
  allow_stopping_for_update = true
  zone = "${var.zone}"
  tags = [ for item in var.network_tags : item ]
  labels = var.client_labels
  boot_disk {
    initialize_params {
      image = "${var.boot_image}"
      labels = var.client_labels
    }
  }

  network_interface {
    network = "${var.vpc_network}"
    subnetwork = google_compute_subnetwork.subnet.self_link
    access_config {
      nat_ip = "${google_compute_address.client_ip.address}"
    }
  }
  service_account {
    email = google_service_account.client_service_account.email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
metadata_startup_script = file("startup.sh")
  
}
resource "google_service_account" "client_service_account" {
  account_id = "${var.client_name}-account"
  display_name = "${var.client_name}-service_account"
}

resource "google_compute_address" "client_ip" {
  name = "${var.client_name}-instance-ip"
  ip_version = "IPV4"
  
}

resource "google_compute_network" "vpc" {
  name = var.vpc_network
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  network = google_compute_network.vpc.self_link
  name = var.subnetwork_name
  ip_cidr_range = "10.85.1.0/24"
}

resource "google_compute_firewall" "firewall" {
  name    = "test-firewall"
  network = google_compute_network.vpc.self_link

  allow {
    protocol = "tcp"
    ports    = ["8080","22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["external-access"]
}

