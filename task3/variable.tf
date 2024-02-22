variable "project_id" {
  default = "project-id"
}

variable "region" {
  default = "asia-south1"
}

variable "zone" {
  default = "asia-south1-a"
}

variable "client_name" {
  type = string
  default = "test"
}

variable "machine_type" {
  default = "n1-standard-1"
}

variable "boot_image" {
  default = "ubuntu-2204-jammy-v20231213a"
}

variable "vpc_network" {
  default = "test-vpc"
}

variable "subnetwork_name" {
  default = "test-subnet"
}

variable "network_tags" {
  type = list(string)
  default = [ "external-access"]
}

variable "client_labels" {
  type    = map(string)
  default = {
    client = "test",
    env = "test",
    product = "test",
    purpose = "test"
  }
}
