  terraform{
  required_version =  ">= 0.11"
  backend "azurerm"{
    storage_account_name = "__terraformstorageaccount__"
    container_name       = "terraform" 
    key                  = "terraform.tfstate"
    access_key           = "__storagekey__"
    features{}
  }
} 
provider "azurerm"{
version = "=2.0.0"
 features{}
}

resource "azurerm_resource_group" "dev" {
  name     = "__rgTerraform__"
  location = "central india"
}

resource "azurerm_app_service_plan" "dev" {
  name                = "__appserviceplan__"
  location            = "${azurerm_resource_group.dev.location}"
  resource_group_name = "${azurerm_resource_group.dev.name}"

  sku {
     tier = "Standard"
     size = "S3"
  }
}

resource "azurerm_app_service" "dev" {
  name                 = "__appservicename__"
  location             = "${azurerm_resource_group.dev.location}"
  resource_group_name  = "${azurerm_resource_group.dev.name}"
  app_service_plan_id  = "${azurerm_app_service_plan.dev.id}"

  site_config {
    java_version  = "1.8"
  }

  stack_settings {
    java_web_server_version = "SE"
  }

  connection_string {
    name  = "PremiumBankDb"
    type  = "MySQL"
    value = "jdbc:mysql://mysqlserver-backend.mysql.database.azure.com:3306/alm?useSSL=true&requireSSL=false&autoReconnect=true&user=Admin123@mysqlserver-backend&password=admin@123"
  }

}

