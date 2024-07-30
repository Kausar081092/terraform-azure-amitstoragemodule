# The output variables for the module
output "sa" {
  value       = azurerm_storage_account.strg_account
  #sensitive   = true
  description = "The Storage Account object."
}

output "storage_account_name" {
  value       = { for idx,sa in azurerm_storage_account.strg_account : idx => sa.name }
  description = "The name of the Storage Account."
}

# output "storage_account_name" {
#   value       = { for sa in azurerm_storage_account.strg_account : sa.name => sa.id }
#   description = "The name of the Storage Account."
# }

output "id" {
  value       = { for idx,sa in azurerm_storage_account.strg_account : idx => sa.id }
  description = "The ID of the Storage Account."
}

output "container_name" {
  value       = azurerm_storage_container.test_strg_container[*].name
  description = "The name of the Storage Account."
}