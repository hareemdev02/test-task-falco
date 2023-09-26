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
  default     = 2
  description = "number of GKE nodes"
}

variable "disk_size_gb" {
  default     = 10
  description = "disk size in GB for each node"
}
variable "suricata_vm_name" {
  description = "Name for the Suricata VM"
  default     = "suricata-vm"
}

variable "machine_type" {
  description = "Machine type for the VM"
  default     = "n1-standard-1"
}
variable "suricata_startup_script" {
  description = "Startup script to install Suricata"
  default     = <<SCRIPT
#!/bin/bash

echo "deb http://http.debian.net/debian buster-backports main" > \
    /etc/apt/sources.list.d/backports.list
apt-get update

apt-get install suricata -t buster-backports

systemctl enable suricata

systemctl start suricata

SURICATA_RULE='alert tcp any any -> any 13666 (msg:"Alert - Process connecting to port 13666"; sid:1000001;)'

echo "$SURICATA_RULE" > /etc/suricata/rules/custom.rules


SCRIPT
}
