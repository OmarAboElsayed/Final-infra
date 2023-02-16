resource "google_compute_network" "myvpc" {
  project                 = "omar-mohamed-el-sayed-project"
  name                    = "myvpc"
  auto_create_subnetworks = false
  mtu                     = 1460
  routing_mode            = "REGIONAL"
}

