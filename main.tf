terraform {
  required_version = ">=1.9.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      #version = ">3.43.0"
    }
  }
  cloud { 
    organization = "delecoute-terraform" 
    workspaces { 
      name = "terraformCICD" 
    } 
  } 
}

provider "azurerm" {
  #skip_provider_registration = true
  subscription_id = "8911ca17-0f83-4672-a8e0-4d5de0ac36eb"
  features {
    #This will allow to delete resources inside resource groups that are not managed by Terraform. 
   resource_group {
     prevent_deletion_if_contains_resources = false
  }

}
}

resource "azurerm_resource_group" "rg" {
  # (resource arguments)
  location = "West Europe"
  name     = "rg-delete"
}

/* resource "azurerm_storage_account" "storage" {
  name                     = "azbkjstg007"
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  resource_group_name      = azurerm_resource_group.rg.name

} */


