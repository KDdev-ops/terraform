resource "google_compute_instance" "kittuvm" {
  name         = "kittuvm"
  machine_type = "n1-standard-1"
  hostname     = "kittuvm.com"
  zone         = "us-central1-a"
  allow_stopping_for_update = true

  labels = {
      name = "kittuvm",
      owner = "kittu",
      user =  "kittu",
      os = "RHEL"

  }

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "Red Hat Enterprise Linux/Red Hat Enterprise Linux 8"
    }
  }

  # // Local SSD disk
  # scratch_disk {
  #   interface = "SCSI"
  #}

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

   #service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    #email  = google_service_account.default.email
    # scopes = ["userinfo-email", "compute-r0", "storage-ro"]
  #}
}