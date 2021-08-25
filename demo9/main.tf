terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~>2.13.0"
    }
  }
}

provider "docker" {
    host    = "npipe:////.//pipe//docker_engine"
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx-dhanush" {
  image = docker_image.nginx.latest
  name  = "nginx-dhanush"
  ports {
    internal = 80
    external = 8099
  }
}