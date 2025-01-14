# Configure the Google Cloud provider
# This block configures Terraform to use Google Cloud with the specified credentials, project, and region.
provider "google" {
  credentials = file("${path.module}/service-account-keys.json")
  project     = var.project_id
  region      = var.region
}

# Create a Google Compute Instance Template
# This resource defines a template for creating VM instances in the Managed Instance Group.
resource "google_compute_instance_template" "mig_template" {
  name         = "${var.instance_name}-template"
  machine_type = var.machine_type

  # Configure the boot disk with an image of Debian 12
  disk {
    auto_delete  = true
    source_image = "projects/debian-cloud/global/images/family/debian-12"
  }

  # Configure network interface with default network and ephemeral public IP
  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  # Specify the startup script to be executed on each VM instance
  metadata_startup_script = file("${path.module}/startup.sh")
}

# Create a Managed Instance Group (MIG)
# This resource defines a group of VM instances managed by Google Cloud.
resource "google_compute_instance_group_manager" "mig" {
  name                = "${var.instance_name}-mig"
  base_instance_name  = var.instance_name
  zone                = "me-west1-b"
  target_size         = 2

  # Link the instance template to the MIG
  version {
    instance_template = google_compute_instance_template.mig_template.self_link
  }

  # Configure auto-healing policies for the MIG
  auto_healing_policies {
    health_check      = google_compute_health_check.mig_health.self_link
    initial_delay_sec = 300
  }
}

# Create a Health Check for the MIG
# This resource configures a health check to monitor the health of VM instances.
resource "google_compute_health_check" "mig_health" {
  name = "${var.instance_name}-health-check"

  http_health_check {
    port = 80
  }
}

# Create an Autoscaler for the MIG
# This resource automatically adjusts the number of VM instances in the MIG based on CPU utilization.
resource "google_compute_autoscaler" "mig_autoscaler" {
  name   = "${var.instance_name}-autoscaler"
  zone   = "me-west1-b"
  target = google_compute_instance_group_manager.mig.self_link

  autoscaling_policy {
    max_replicas    = 5
    min_replicas    = 1
    cooldown_period = 60

    cpu_utilization {
      target = 0.6
    }
  }
}
