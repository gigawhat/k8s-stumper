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
