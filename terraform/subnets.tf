resource "google_compute_subnetwork" "private" {
    name = "private"
    ip_cidr_range = var.subnet_cidr_range
    region = var.region_name
    network = google_compute_network.dev.id
    private_ip_google_access = true
    
    secondary_ip_range {
        range_name = "k8s-pod-range"
        ip_cidr_range = var.k8s_podip_range
    }

    secondary_ip_range {
      range_name = "k8s-service-range"
      ip_cidr_range = var.k8s_serviceip_range
    }
}