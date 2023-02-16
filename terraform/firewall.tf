# resource "google_compute_firewall" "allow-iap" {
#   name    = "allow-iap"
#   network = google_compute_network.myvpc.id
#   allow {
#     protocol = "tcp"
#     ports    = ["80", "22"]
#   }
#   direction     = "INGRESS"
#   source_ranges = ["35.235.240.0/20"]
# }
resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = google_compute_network.myvpc.name

  allow {
    protocol = "tcp"
    ports    = ["80","22"]
  }

  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
}