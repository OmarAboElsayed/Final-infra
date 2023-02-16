

resource "google_compute_subnetwork" "management" {
  name          = var.subnet
  ip_cidr_range = var.cidr1
  region        = var.region
  network       = google_compute_network.myvpc.id
  private_ip_google_access = true
  secondary_ip_range {
    range_name    = "k8s-pod-range"
    ip_cidr_range = "10.0.3.0/24"
  }
  secondary_ip_range {
    range_name    = "k8s-service-range"
    ip_cidr_range = "10.0.4.0/24"
  }
}

