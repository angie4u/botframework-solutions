data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "master" {
  name                        = "${format("%s%s%s", var.master_key_vault, var.uniquesalt, "Kv")}"
  location                    = "${azurerm_resource_group.k8s.location}"
  resource_group_name         = "${azurerm_resource_group.k8s.name}"
  tenant_id                   = "${data.azurerm_client_config.current.tenant_id}"

  sku_name = "standard"

  access_policy {
    tenant_id = "${data.azurerm_client_config.current.tenant_id}"
    object_id = "${data.azuread_group.VAmeetsAKSdevs.id}"

    certificate_permissions = [
      "create",
      "delete",
      "get",
      "list",
    ]

    key_permissions = [
      "create",
      "delete",
      "get",
      "list",
    ]

    secret_permissions = [
      "set",
      "get",
      "delete",
      "list",
    ]
  }

  tags {
     Environment = "${var.envtag}"
  }
}

resource "azurerm_key_vault_secret" "AKSsp" {
  name         = "aks-sp-clientsecret"
  value        = "${random_password.password.result}"
  key_vault_id = "${azurerm_key_vault.master.id}"
}

resource "azurerm_key_vault_secret" "AppInsights" {
  name         = "app-insight-instrumentation-key"
  value        = "${azurerm_application_insights.central.instrumentation_key}"
  key_vault_id = "${azurerm_key_vault.master.id}"
}

# Removed because end-to-end deployment not possible for CosmosDB
# resource "azurerm_key_vault_secret" "CosmosDBKey1" {
#   name         = "cosmosdb-primary-masterkey"
#   value        = "${azurerm_cosmosdb_account.db.primary_master_key}"
#   key_vault_id = "${azurerm_key_vault.master.id}"
# }

resource "azurerm_key_vault" "motherbot" {
  name                        = "${format("%s%s%s", var.motherbot_key_vault, var.uniquesalt, "Kv")}"
  location                    = "${azurerm_resource_group.k8s.location}"
  resource_group_name         = "${azurerm_resource_group.k8s.name}"
  tenant_id                   = "${data.azurerm_client_config.current.tenant_id}"

  sku_name = "standard"

  access_policy {
    tenant_id = "${data.azurerm_client_config.current.tenant_id}"
    object_id = "${data.azuread_group.VAmeetsAKSdevs.id}"

    secret_permissions = [
      "set",
      "get",
      "delete",
      "list",
    ]
  }

  tags {
     Environment = "${var.envtag}"
     Usage = "${var.motherbot_usagetag}"
  }
}

resource "azurerm_key_vault" "POISkillBot" {
  name                        = "${format("%s%s%s", var.poi_key_vault, var.uniquesalt, "Kv")}"
  location                    = "${azurerm_resource_group.k8s.location}"
  resource_group_name         = "${azurerm_resource_group.k8s.name}"
  tenant_id                   = "${data.azurerm_client_config.current.tenant_id}"

  sku_name = "standard"

  access_policy {
    tenant_id = "${data.azurerm_client_config.current.tenant_id}"
    object_id = "${data.azuread_group.VAmeetsAKSdevs.id}"

    secret_permissions = [
      "set",
      "get",
      "delete",
      "list",
    ]
  }

  tags {
     Environment = "${var.envtag}"
     Usage = "${var.poi_usagetag}"
  }
}
