terraform {
  required_providers {
    docker = {
      source = "terraform-providers/docker"
      version = "~> 2.7.2"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name          = "nginx:1.17.7"
  keep_locally  = false
}

resource "docker_container" "docker_health" {
  image = docker_image.nginx.latest
  name  = "test"
  ports {
    internal = 80
    external = 8080
  }
  healthcheck {
    test = ["CMD", "wget", "-q", "--method=HEAD", "localhost/system-status.txt"]
  }
}
