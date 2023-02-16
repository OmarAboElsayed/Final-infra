resource "google_container_node_pool" "nodepool" {
  name       = "nodepool"
  location   = var.zone
  cluster    = google_container_cluster.mycluster.id
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
