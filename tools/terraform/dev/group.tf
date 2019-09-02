# Uncomment for Non Microsoft tenant
#resource "azuread_group" "VAmeetsAKSdevs" {
#  name = "VA-meets-AKS-developers"
#}

# Comment for Non Microsoft tenant
data "azuread_group" "VAmeetsAKSdevs" {
  name = "CSE-VA-meets-AKS-developers"
}