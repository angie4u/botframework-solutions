resource "azurerm_storage_account" "store" {
  name                     = "${format("%s%s%s", var.storage_name, var.uniquesalt, "v2")}"
  resource_group_name      = "${azurerm_resource_group.k8s.name}"
  location                 = "${azurerm_resource_group.k8s.location}"
  account_tier             = "Standard"
  account_kind             = "StorageV2"
  account_replication_type = "LRS"

  tags = {
    Environment = "${var.envtag}"
  }
}