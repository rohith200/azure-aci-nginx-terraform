output "nginx_url" {
  value = "http://${azurerm_container_group.nginx.fqdn}"
}
