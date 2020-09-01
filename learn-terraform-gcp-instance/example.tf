terraform {
  required_providers {
    gcp = {
        source = "hashicorp/google"
        version = "~> 3.36.0"
    }
  }
}

provider "google" {
  credentials = file("account.json")
  project     = "terraform-practice-287722"
  region      = "us-west3"
}

resource "google_compute_instance" "vm_instance"{
  name = "test_instance"
  machine_type = "f1-micro"
  zone = "us-west3-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

}
