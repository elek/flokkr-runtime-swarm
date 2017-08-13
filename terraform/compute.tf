
provider "google" {
  credentials = "${file(pathexpand("~/.config/terraform/gce-account.json"))}"
  project     = "flokkr-175620"
  region      = "europe-west1"
}

resource "google_compute_instance" "consul" {
 count = 5
 project = "flokkr-175620"
 zone = "europe-west1-d"
 name = "consul-${count.index}"
 machine_type = "n1-standard-1"
 disk {
   image = "ubuntu-1604-xenial-v20170803"
 }
 network_interface {
   network = "default"
   access_config {
   }
 }
 scheduling {
   preemptible = true
 }
 connection {
    user = "ubuntu"
 }
 provisioner "remote-exec" {
    script = "docker-install.sh"
 }
}

output "master_ip" {
 value = "${google_compute_instance.consul.0.network_interface.0.address}"
}
