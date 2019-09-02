resource "azuread_application" "k8s" {
  name                       = "${var.cluster_name}"
  homepage                   = "https://${var.cluster_name}"
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = true
}

resource "azuread_service_principal" "k8s" {
  application_id = "${azuread_application.k8s.application_id}"
}

resource "azuread_service_principal_password" "k8s" {
  service_principal_id = "${azuread_service_principal.k8s.id}"
  value                = "${azurerm_key_vault_secret.AKSsp.value}"
  end_date             = "${var.end_date}"
}