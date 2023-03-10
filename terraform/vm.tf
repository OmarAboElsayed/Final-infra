resource "google_compute_instance" "vm" {
  name         = var.vm
  machine_type = "e2-medium"
  zone         = var.zone
  

  depends_on = [
    google_container_cluster.mycluster
   , google_container_node_pool.nodepool
  ]
  
    service_account {
    email = google_service_account.node-service-account.email
    scopes = ["https://www.googleapis.com/auth/cloud-platform" ]
  }
  
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size = 50
    }
  }
 
  network_interface {
    network = google_compute_network.myvpc.id
    subnetwork = google_compute_subnetwork.management.id
  }
}

