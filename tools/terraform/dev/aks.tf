resource "azurerm_role_assignment" "k8scontrib" {
  scope                = "${azurerm_resource_group.k8s.id}"
  role_definition_name = "Contributor"
  principal_id         = "${azuread_service_principal.k8s.id}"
}

resource "azurerm_log_analytics_workspace" "loganw" {
    name                = "${format("%s%s", var.log_analytics_workspace_name, var.uniquesalt)}"
    location            = "${var.log_analytics_workspace_location}"
    resource_group_name = "${azurerm_resource_group.k8s.name}"
    sku                 = "${var.log_analytics_workspace_sku}"

    tags {
      Environment = "${var.envtag}"
    }
}

resource "azurerm_log_analytics_solution" "logans" {
    solution_name         = "ContainerInsights"
    location              = "${azurerm_log_analytics_workspace.loganw.location}"
    resource_group_name   = "${azurerm_resource_group.k8s.name}"
    workspace_resource_id = "${azurerm_log_analytics_workspace.loganw.id}"
    workspace_name        = "${azurerm_log_analytics_workspace.loganw.name}"

    plan {
        publisher = "Microsoft"
        product   = "OMSGallery/ContainerInsights"
    }
}


resource "azurerm_kubernetes_cluster" "k8s" {
  name                = "${var.cluster_name}"
  location            = "${azurerm_resource_group.k8s.location}"
  resource_group_name = "${azurerm_resource_group.k8s.name}"
  dns_prefix          = "${var.dns_prefix}"

  agent_pool_profile {
    name            = "pool1"
    count           = "${var.agent_count}"
    vm_size         = "${var.vm_size}"
    os_type         = "Linux"
    os_disk_size_gb = 30
  }

  service_principal {
      client_id     = "${azuread_application.k8s.application_id}"
      client_secret = "${azuread_service_principal_password.k8s.value}"
  }

  addon_profile {
      oms_agent {
          enabled                    = true
          log_analytics_workspace_id = "${azurerm_log_analytics_workspace.loganw.id}"
      }
  }

  tags {
      Environment = "${var.envtag}"
  }
}