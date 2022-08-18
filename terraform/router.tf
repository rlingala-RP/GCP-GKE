resource "google_compute_router" "router" {
    name = var.router_name
    region = var.region_name
    network = google_compute_network.dev.id
}