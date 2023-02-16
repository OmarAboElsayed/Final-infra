resource "google_compute_firewall" "allow" {
  name    = "allow"
  network = google_compute_network.myvpc.name

  allow {
    protocol = "tcp"
    ports    = ["80","22"]
  }

  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
}
