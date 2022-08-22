resource "google_service_account" "devkube" {
    account_id = var.google_service_accountid  
}

resource "google_container_node_pool" "devpool" {
    name = var.conatiner_nodepool_name
    cluster = google_container_cluster.dev.id
    node_count = 1

    management {
      auto_repair = true
      auto_upgrade = true
    }

    autoscaling {
      min_node_count=0
      max_node_count=10
    }

    node_config {
      preemptible = true
      machine_type = var.node_machine_type

      labels = {
        role = var.containernode_role_name
      }
      
      service_account = google_service_account.devkube.email
      oauth_scopes = [
        "https://www.googleapis.com/auth/cloud-platform"
      ]
    }
}