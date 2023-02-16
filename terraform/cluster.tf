
resource "google_container_cluster" "mycluster" {
  name     = var.cluster
  location = var.zone
   
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = google_compute_network.myvpc.id
  subnetwork               = google_compute_subnetwork.management.id
  
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = var.cidr1
     
    }
  }
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
    workload_pool = "omar-mohamed-el-sayed-project.svc.id.goog"
  }
  ip_allocation_policy {
    cluster_secondary_range_name  = var.deployment
    services_secondary_range_name = var.service
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }
  node_config {
  service_account = google_service_account.node-service-account.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}


