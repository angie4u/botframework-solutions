resource "azurerm_container_registry" "acr" {
  name                     = "${format("%s%s", var.acr_name, random_id.unique.hex)}"
  resource_group_name      = "${azurerm_resource_group.k8s.name}"
  location                 = "${azurerm_resource_group.k8s.location}"
  sku                      = "Basic"
  admin_enabled            = false
}

resource "azurerm_role_assignment" "acrpush" {
  scope                = "${azurerm_resource_group.k8s.id}"
  role_definition_name = "AcrPush"
  principal_id         = "${azuread_service_principal.k8s.id}"
}