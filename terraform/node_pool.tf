# resource "google_container_node_pool" "nodepool2000" {
#   name       = "nodepool2000"
#   location   = "us-central1"
#   cluster    = google_container_cluster.my-cluster.name
#   node_count = 1                                              

#   node_config {                                                                                                                                                                                                                                                                                                                                                                                                         
#     preemptible  = false                                                
#     machine_type = "e2-small"

#     # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
#     service_account = google_service_account.node-service-account.email
#     oauth_scopes = [
#       "https://www.googleapis.com/auth/cloud-platform"
#     ]                                                                                                                                                                                 
#   }
# }