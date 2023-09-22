resource "google_compute_instance" "suricata_vm" {
  name         = var.suricata_vm_name
  machine_type = var.machine_type
  zone         = "${var.region}-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"  # Use a suitable Debian image
      size  = 10
    }
  }

  network_interface {
    network = google_compute_network.vpc.name
    access_config {}
  }

  metadata_startup_script = var.suricata_startup_script
}
