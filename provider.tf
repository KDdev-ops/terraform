provider "google" {
  credential = file("credential.json")
  project = "{{createvmusing-tf}}"
  region  = "us-central1"
  zone    = "us-central1-c"
}