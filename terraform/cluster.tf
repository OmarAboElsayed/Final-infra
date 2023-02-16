# #creating private cluster ans associate it to restricted subnet
# resource "google_container_cluster" "my-cluster" {
#   name     = "my-cluster"
#   location = "us-central1-a"
#   # creating the least possible node pool  
#   remove_default_node_pool = true
#   initial_node_count       = 1
#   network                  = google_compute_network.myvpc.id
#   subnetwork               = google_compute_subnetwork.management.id


#   master_authorized_networks_config {
#     cidr_blocks {
#       cidr_block   = "10.0.1.0/24"
#       display_name = "managment-cidr-range"
#     }
#   }

#   ip_allocation_policy {
#     cluster_ipv4_cidr_block  = "10.16.0.0/16"
#     services_ipv4_cidr_block = "10.12.0.0/16"
#   }


#   private_cluster_config {
#     enable_private_nodes    = true
#     enable_private_endpoint = true
#     master_ipv4_cidr_block  = "172.16.0.0/28"
#   }

# }




resource "google_container_cluster" "my-cluster" {
  name     = "my-cluster"
  location = "us-central1-a"
   
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = google_compute_network.myvpc.id
  subnetwork               = google_compute_subnetwork.management.id
  
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = "10.0.1.0/24"
      display_name = "managment-cidr-range"
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
    cluster_secondary_range_name  = "k8s-pod-range"
    services_secondary_range_name = "k8s-service-range"
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
resource "google_container_node_pool" "nodepool" {
  name       = "nodepool"
  location   = "us-central1-a"
  cluster    = google_container_cluster.my-cluster.id
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-micro"
    # custom service account
    service_account = google_service_account.node-service-account.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}


# resource "google_container_node_pool" "nodepool" {
#   name       = "nodepool"
#   location   = "us-central1-a"
#   cluster    = google_container_cluster.my-cluster.id
#   node_count = 1
#    management {
#     auto_repair  = true
#     auto_upgrade = true
#       }

#   node_config {
#     preemptible  = true
#     machine_type = "e2-medium"
#     service_account = google_service_account.project-service-account.email
#     oauth_scopes = [
#       "https://www.googleapis.com/auth/cloud-platform"
#     ]
#   }
# }