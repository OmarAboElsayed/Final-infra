provider "google" {
project = var.project
credentials = file("./file.json")
region = "us-central1"
}
