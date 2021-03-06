provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = false
    }
  }
  version         = "=2.0.0"
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg_name" {
  name     = var.rg_name
  location = "WestEurope"
}

resource "azurerm_key_vault" "example" {
  name                        = var.kvt_name
  location                    = azurerm_resource_group.rg_name.location
  resource_group_name         = azurerm_resource_group.rg_name.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_enabled         = false
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "get",
    ]

    secret_permissions = [
      "get",
    ]

    storage_permissions = [
      "get",
    ]
  }

  tags = var.tags
}
//coment added
