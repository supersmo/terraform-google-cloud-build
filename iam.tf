### SERVICE ACCOUNT CREATION
resource "google_service_account" "example" {
  project      = var.DEPLOY_PROJECT
  account_id   = "example-sa-${var.HACKATHON_TEAM_NAME}"
  display_name = "example-sa-${var.HACKATHON_TEAM_NAME}"
}