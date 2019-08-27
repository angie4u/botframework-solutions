provider "azurerm" {
    version = "~>1.31"
}

# Configure the Microsoft Azure Active Directory Provider
provider "azuread" {
  version = "~>0.3.0"
}

provider "random" {
  version = "~>0"
}
