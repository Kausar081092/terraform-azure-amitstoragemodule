# Storage account creation 
resource "azurerm_storage_account" "strg_account" {

  for_each = { for sa in var.storage-account : sa.name => sa }

  name                            = lower(format("%s%s%s%s%s%s", "st", each.value.environment_name, "subinfra", each.value.name, each.value.workload, each.value.instance_number))
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  account_tier                    = each.value.account_tier
  account_replication_type        = each.value.account_replication_type
  account_kind                    = each.value.account_kind
  access_tier                     = each.value.access_tier
  min_tls_version                 = each.value.min_tls_version
  allow_nested_items_to_be_public = each.value.allow_blob_public_access
  enable_https_traffic_only       = each.value.enable_https_traffic_only
  tags                            = each.value.tags
  public_network_access_enabled   = each.value.public_network_access

  blob_properties {
    delete_retention_policy {
      days = each.value.blob_retention
    }
    container_delete_retention_policy {
      days = each.value.container_retention
    }
  }

  network_rules {
    default_action             = each.value.default_network_access
    virtual_network_subnet_ids = each.value.subnet_ids
    ip_rules                   = each.value.ip_rules
  }
}

# Storage account container creation

resource "azurerm_storage_container" "test_strg_container" {
  count                 = length(var.storage-account-containers)
  name                  = var.storage-account-containers[count.index].container_name
  storage_account_name  = var.storage-account-containers[count.index].storage_account_name
  container_access_type = "private"
}


