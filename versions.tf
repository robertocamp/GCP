// Configure the Google Cloud provider
provider "google" {
 credentials = file("ptf-1-322802-88d73bf6f72f.json")
 project     = "ptf-1-322802"
 region      = "us-west1"
}