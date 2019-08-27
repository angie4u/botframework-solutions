resource "azurerm_cognitive_account" "luis-dispatch" {
  name                = "luis-dispatch"
  location            = "${azurerm_resource_group.k8s.location}"
  resource_group_name = "${azurerm_resource_group.k8s.name}"
  kind                = "LUIS"

  sku {
    name = "${var.cognitive_service_sku}"
    tier = "${var.cognitive_service_tier}"
  }

  tags = {
    Environment = "${var.envtag}"
  }
}

resource "azurerm_cognitive_account" "luis-mb" {
  name                = "luis-mb-dispatch"
  location            = "${azurerm_resource_group.k8s.location}"
  resource_group_name = "${azurerm_resource_group.k8s.name}"
  kind                = "LUIS"

  sku {
    name = "${var.cognitive_service_sku}"
    tier = "${var.cognitive_service_tier}"
  }

  tags = {
    Environment = "${var.envtag}"
  }
}

resource "azurerm_cognitive_account" "luis-poi" {
  name                = "luis-poi"
  location            = "${azurerm_resource_group.k8s.location}"
  resource_group_name = "${azurerm_resource_group.k8s.name}"
  kind                = "LUIS"

  sku {
    name = "${var.cognitive_service_sku}"
    tier = "${var.cognitive_service_tier}"
  }

  tags = {
    Environment = "${var.envtag}"
  }
}