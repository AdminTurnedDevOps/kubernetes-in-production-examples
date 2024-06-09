provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_cloud_run_service" "default" {
  name     = "cloudrun-srv"
  location = var.region

  template {
    spec {
      containers {
       # image = "us-docker.pkg.dev/cloudrun/container/hello"
        image = "adminturneddevops/golangwebapi:latest"

        ports {
          container_port = 8080
        }

        resources {
            limits = {
              memory = "128Mi"
            }

            requests = {
              cpu = "500m"
            }
        }
      }
    }

  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}