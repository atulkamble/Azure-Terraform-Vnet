terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.54.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "50818730-e898-4bc4-bc35-d998af53d719"
}

resource "azurerm_resource_group" "myrg" {
  name     = "myRG"
  location = "centralindia"
}

resource "azurerm_virtual_network" "myvnet" {
  name                = "myvnet"
  resource_group_name = "myRG"
  location            = "centralindia"
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnetA" {
  name                 = "subnetA"
  virtual_network_name = "myvnet"
  resource_group_name  = "myRG"
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "subnetB" {
  name                 = "subnetB"
  virtual_network_name = "myvnet"
  resource_group_name  = "myRG"
  address_prefixes     = ["10.0.2.0/24"]
}
