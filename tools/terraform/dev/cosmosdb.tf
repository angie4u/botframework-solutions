# Not possible to create a collection - only up to database
# resource "azurerm_cosmosdb_account" "cosmos" {
#   name                = "${format("%s%s", "VAmeetsAKS", random_id.server.hex)}"
#   location            = "${azurerm_resource_group.k8s.location}"
#   resource_group_name = "${azurerm_resource_group.k8s.name}"
#   offer_type          = "Standard"
#   kind                = "GlobalDocumentDB"

#   enable_automatic_failover = false

#   consistency_policy {
#     consistency_level       = "Session"
#     max_interval_in_seconds = 10
#     max_staleness_prefix    = 200
#   }
# }

# resource "azurerm_cosmosdb_sql_database" "VADB" {
#   name                = "VirtualAssistantDB"
#   resource_group_name = "${data.azurerm_cosmosdb_account.cosmos.resource_group_name}"
#   account_name        = "${data.azurerm_cosmosdb_account.cosmos.name}"
# }