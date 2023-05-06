# Azure Provider source and version being used
#Version 2
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.43.0"
    }
  }
  cloud {
    organization = "ParminderSaini"

    workspaces {
      name = "Hands_On_with_terraform_on_Azure"
    }
  }
}
provider "azurerm" {
  features {
  }
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "813-6f084f37-hands-on-with-terraform-on-azure"
  location = "South Central US"
}

module "securestorage2" {
  source               = "app.terraform.io/ParminderSaini/securestorage2/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "strhandsOnlab1"
}




