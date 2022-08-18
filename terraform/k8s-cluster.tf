resource "google_container_cluster" "dev" {
    name = var.k8s_cluster_name
    location = var.nodea_region
    remove_default_node_pool = true
    initial_node_count = 1
    network = google_compute_network.dev.self_link
    subnetwork = google_compute_subnetwork.private.self_link
    logging_service = "logging.googleapis.com/kubernetes"
    monitoring_service = "monitoring.googleapis.com/kubernetes"
    networking_mode = "VPC_NATIVE"

    node_locations = [
        var.nodeb_region
    ]

    addons_config {
      http_load_balancing {
        disabled = true
      }
      
      horizontal_pod_autoscaling {
        disabled = false
      }
    }

    release_channel {
      channel = "REGULAR"
    }

    workload_identity_config {
      workload_pool = var.workload_pool_name
    }

    ip_allocation_policy {
      cluster_secondary_range_name = "k8s-pod-range"
      services_secondary_range_name = "k8s-service-range"
    }

    private_cluster_config {
      enable_private_nodes = true
      enable_private_endpoint = false
      master_ipv4_cidr_block = var.private_cluster_config_cidrrange
    }
}