resource "azurerm_application_insights" "central" {
  name                = "VAmeetsAKS"
  location            = "${azurerm_resource_group.k8s.location}"
  resource_group_name = "${azurerm_resource_group.k8s.name}"
  application_type    = "web"
}