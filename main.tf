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
  features { }

  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}




resource "azurerm_resource_group" "rg" {
  # (resource arguments)
  location = "West Europe"
  name     = "rg-delete"
}

resource "azurerm_storage_account" "storage" {
  name                     = "azbkjstg007"
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  resource_group_name      = azurerm_resource_group.rg.name

} 


