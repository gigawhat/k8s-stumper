terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {

}

provider "random" {

}

provider "local" {

}
variable "cluster_count" {
  default = 1
  description = "Number of clusters to create"
  type = number
  validation {
    condition = var.cluster_count > 0 && var.cluster_count < 7
    error_message = "Cluster count must be between 1 and 6"
  }
}

module "cluster" {
  count = var.cluster_count
  source = "./modules/setup"
}
