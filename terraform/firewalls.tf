resource "google_compute_firewall" "enable-ssh" {
    name = "enable-ssh"
    network = google_compute_network.dev.name

    allow {
      protocol = "tcp"
      ports = var.port_numbers
    }

    source_ranges = var.source_range
}