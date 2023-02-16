
#it's recommended to create service account for gke 
resource "google_service_account" "node-service-account" {
  account_id = "node-service-account"
  project = "omar-mohamed-el-sayed-project"
}

#grant access to service account usinf iam binding
resource "google_project_iam_binding" "node-service-account-iam" {
  project = "omar-mohamed-el-sayed-project"
  role    = "roles/storage.admin"
  members = [
    "serviceAccount:${google_service_account.node-service-account.email}"
  ]
}


