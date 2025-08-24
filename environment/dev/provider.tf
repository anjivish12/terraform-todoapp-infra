terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.23.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "anjali-rg"
    storage_account_name = "anjalistorage12"
    container_name       = "anji-con"
    key                  = "dev.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "96a3eaff-d4cf-4222-9fe7-1622ab46f13e"

}