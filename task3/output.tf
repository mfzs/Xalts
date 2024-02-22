output "mesaage" {
  value = "This will take 3-5 Mins to up the health of the API Kinldy wait for it... As startup Script is In Progress"
}
output "health_url" {
  value = "http://${google_compute_instance.client_instance.network_interface.0.access_config.0.nat_ip}:8080/health"
}