resource "google_compute_network" "myvpc" {
  project                 = var.project
  name                    = var.vpc
  auto_create_subnetworks = false
  mtu                     = 1460
  routing_mode            = "REGIONAL"
}

