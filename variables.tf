variable "project_id" {
  description = "Google Cloud project ID"
}

variable "region" {
  description = "Google Cloud region"
}

variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  description = "gke password"
}

variable "gke_num_nodes" {
  default     = 3
  description = "number of GKE nodes"
}

variable "disk_size_gb" {
  default     = 10
  description = "disk size in GB for each node"
}