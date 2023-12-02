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

// Create a random pet name to avoid name clashes
resource "random_pet" "this" {
    length = 2
    separator = "-"
}

// Get the latest version of Kubernetes available
data "digitalocean_kubernetes_versions" "this" {}


// Create a Kubernetes cluster
resource "digitalocean_kubernetes_cluster" "this" {
    name = random_pet.this.id
    region = "sfo3"
    version = data.digitalocean_kubernetes_versions.this.latest_version
    node_pool {
        name = "default"
        size = "s-2vcpu-2gb"
        node_count = 1
    }
    lifecycle {
      ignore_changes = [ version ]
    }
}

// Create a kubeconfig file
resource "local_file" "this" {
    content = digitalocean_kubernetes_cluster.this.kube_config.0.raw_config
    filename = "${path.root}/kubeconfig-${random_pet.this.id}.yaml"
}

// Use a local-exec provisioner to set the KUBECONFIG environment variable
resource "null_resource" "this" {
    triggers = {
        filename = local_file.this.content
    }
    provisioner "local-exec" {
        command = "kubectl --kubeconfig=${local_file.this.filename} apply -f ${path.module}/k8s-stumper.yaml 2>/dev/null"
    }
}
