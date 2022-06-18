provider "azurerm" {
    version = 1.38
    }

resource "azurerm_app_service_plan" "svcplan" {
  name                = "lalab-webapp-serviceplan"
  location            = "eastus"
  resource_group_name = "($azresourcegroup)"

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "appsvc" {
  name                = "lalab-webapp-1"
  location            = "eastus"
  resource_group_name = "($azresourcegroup)"
  app_service_plan_id = azurerm_app_service_plan.svcplan.id


  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }
}