provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
  version = "=2.0.0"
}

data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "rg_name" {
  name = var.rg_name
}

resource "azurerm_key_vault" "example" {
  name                        = var.kvt_name
  location                    = data.azurerm_resource_group.rg_name.location
  resource_group_name         = data.azurerm_resource_group.rg_name.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_enabled         = true
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
}
