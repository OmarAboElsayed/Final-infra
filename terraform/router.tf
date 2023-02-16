resource "google_compute_router" "router" {
  name    = "router"
  network = google_compute_network.myvpc.id
  region  = google_compute_subnetwork.management.region
}