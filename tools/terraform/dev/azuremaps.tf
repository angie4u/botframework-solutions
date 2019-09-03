resource "azurerm_maps_account" "maps" {
  name                = "${var.maps_name}"
  resource_group_name = "${azurerm_resource_group.k8s.name}"
  sku_name            = "s0"

  tags = {
    Environment = "${var.envtag}"
  }
}