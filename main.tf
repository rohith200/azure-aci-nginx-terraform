provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "aci-rg"
  location = "East US"
}

resource "azurerm_container_group" "nginx" {
  name                = "nginx-container"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"

  container {
    name   = "nginx"
    image  = "nginx"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }

  ip_address {
    type            = "Public"
    dns_name_label  = "nginx-demo-rohith123"  # must be globally unique
    ports {
      port     = 80
      protocol = "TCP"
    }
  }
}
