variable "agent_count" {
    default = 1
}

variable "envtag" {
    default = "Development"
}
variable "master_key_vault"
{
    default = "VmAMaster"
}

variable "motherbot_key_vault" {
    default = "VmAMotherBot"
}

variable "motherbot_usagetag" {
    default = "MotherBot"
}

variable "poi_key_vault" {
    default = "VmAPOI"
}

variable "poi_usagetag" {
    default = "POI"
}

variable "vm_size" {
  default = "Standard_B2s" // "Standard_DS1_v2" 
}

variable "dns_prefix" {
    default = "csevameetsaksdev"
}

variable cluster_name {
    default = "csevameetsaksdev"
}

variable acr_name {
    default = "VAmeetsAKS"
}

variable resource_group_name {
    default = "VAmeetsAKSdevRg"
}

variable location {
    default = "koreacentral"
}

variable storage_name {
    default = "vameetsaks"
}

variable maps_name {
    default = "VAmeetsAKS"
}

# for service names
variable uniquesalt {
}

resource "random_id" "unique" {
  byte_length = 4
}

resource "random_password" "password" {
  length = 32
  special = true
  override_special = "/@"
}

variable "cognitive_service_sku" {
    default = "S0"
}

variable "cognitive_service_tier" {
    default = "Standard"
}

variable log_analytics_workspace_name {
    default = "csevameetsaksloganalytics"
}

# refer https://azure.microsoft.com/global-infrastructure/services/?products=monitor for log analytics available regions
variable log_analytics_workspace_location {
    default = "koreacentral"
}

# refer https://azure.microsoft.com/pricing/details/monitor/ for log analytics pricing 
variable log_analytics_workspace_sku {
    default = "PerGB2018"
}

# For Certificates and Service Principal Password etc.
variable end_date {
    default = "2020-12-31T00:00:00Z"
}