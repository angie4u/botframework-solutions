resource "azurerm_resource_group" "k8s" {
    name     = "${var.resource_group_name}"
    location = "${var.location}"

    tags {
      Environment = "${var.envtag}"
    }
}


resource "azurerm_role_assignment" "devowners" {
  scope                = "${azurerm_resource_group.k8s.id}"
  role_definition_name = "Owner"
  principal_id         = "${data.azuread_group.VAmeetsAKSdevs.id}"
}
