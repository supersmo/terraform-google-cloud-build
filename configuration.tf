terraform {
  backend "gcs" {
  }
  required_providers {
    google = {}
    google-beta = {}
  }
}

provider "google" {
  project = var.DEPLOY_PROJECT
  region  = "europe-north1"
  zone    = "europe-north1-a"
}

provider "google-beta" {
  project = var.DEPLOY_PROJECT
  region  = "europe-north1"
  zone    = "europe-north1-a"
}
