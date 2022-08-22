provider "google" {
  project = var.project_id
  region  = var.region_name
}

 terraform {
  backend "gcs" {
    bucket = "dev-terraf-bucket"
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 4.0"
    }
  }
 }