terraform {
  required_version = "~> 1.2.2"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {}

resource "digitalocean_droplet" "web" {
  image     = "ubuntu-20-04-x64"
  name      = "kubernetesmaster"
  region    = "fra1"
  size      = "s-2vcpu-4gb"
}


resource "digitalocean_droplet" "terramino" {
  image     = "ubuntu-20-04-x64"
  name      = "kubernetesworker"
  region    = "fra1"
  size      = "s-2vcpu-4gb"
}
