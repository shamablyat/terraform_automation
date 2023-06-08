terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.28.1"
    }
  }
}

provider "digitalocean" {
    token = var.digital_ocean_token
}

resource "digitalocean_droplet" "web" {
  image    = var.os-type
  name     = var.server-name
  region   = "fra1"
  size     = "s-1vcpu-1gb"
  ssh_keys = [ digitalocean_ssh_key.ssh-key.id ]
}

resource "digitalocean_ssh_key" "ssh-key" {
  name       = "Terraform Example ssh key"
  public_key = file("/home/shama/.ssh/id_rsa.pub")
}