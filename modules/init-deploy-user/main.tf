resource "google_project_service" "iam_api" {
  project = var.project_id
  service = "iam.googleapis.com"
  disable_on_destroy = false
}

resource "google_service_account" "deployer_user" {
  account_id = var.deploy_user
  project = var.project_id

  depends_on = [google_project_service.iam_api]
}

resource "google_project_iam_binding" "storage_admin_binding" {
  project = var.project_id
  role    = "roles/storage.Admin"
  members = ["serviceAccount:${google_service_account.deployer_user.email}"]
  depends_on = [google_service_account.deployer_user]
}

resource "google_service_account_key" "terraform_user_key" {
  service_account_id = google_service_account.deployer_user.email
}

resource "local_file" "service_account_key" {
  content  = base64decode(google_service_account_key.terraform_user_key.private_key)
  filename = "./service-account.json"
}
