provider "google" {
  project = "peaceful-crane-278322"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_container_cluster" "gke-cluster" {
  name               = "my-first-gke-cluster"
  network            = "default"
  location           = "us-central1-c"
  initial_node_count = 1
}

resource "google_container_node_pool" "node-pool" {
  name               = "extra-node-pool"
  location           = "us-central1-c"
  cluster            = "${google_container_cluster.gke-cluster.name}"
  initial_node_count = var.extra_nodes
}
