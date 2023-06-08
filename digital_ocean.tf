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
  image    = "ubuntu-18-04-x64"
  name     = "web-1"
  region   = "nyc3"
  size     = "s-1vcpu-1gb"
  ssh_keys = [ digitalocean_ssh_key.ssh-key.id ]
}

resource "digitalocean_ssh_key" "ssh-key" {
  name       = "Terraform Example ssh key"
  public_key = file("/home/shama/.ssh/id_rsa.pub")
}