terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.36.0"
    }
  }
}

provider "google" {
  credentials = file("terraform-practice-287722-c3b668866e56.json")
  project     = "terraform-practice-287722"
  region      = "us-west3"
  zone        = "us-west3-b"
}

resource "google_compute_network" "vpc_network"{
  name = "terraform-network"
  auto_create_subnetworks = "true"
}

resource "google_compute_instance" "vm_instance" {
  name         = "tamara-test"
  machine_type = "f1-micro"
  zone         = "us-west3-b"
  network_interface {
    network = google_compute_network.vpc_network.self_link
    access_config {

    }
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

}
