### PUBSUB 
resource "google_pubsub_topic" "example" {
  project = var.DEPLOY_PROJECT
  name    = "example-topic-${var.HACKATHON_TEAM_NAME}"

  message_storage_policy {
    allowed_persistence_regions = [
      "europe-north1",
      "europe-west1",
      "europe-west4",
    ]
  }

  labels = {
    ownerteam     = var.HACKATHON_TEAM_NAME
  }
}

### GIVE SERVICE ACCOUNT ACCESS AS PUBLISHER
resource "google_pubsub_topic_iam_member" "example-sa-publisher" {
  project   = var.DEPLOY_PROJECT
  topic     = google_pubsub_topic.example.name
  role      = "roles/pubsub.publisher"
  member    = "serviceAccount:${google_service_account.example.email}"
}