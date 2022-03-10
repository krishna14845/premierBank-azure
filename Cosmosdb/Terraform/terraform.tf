# terraform {
#   required_providers {
#     azurerm = {
#       source = "hashicorp/azurerm"
#       version = "2.98.0"
#     }
#   }
# }

# provider "azurerm" {
#   # Configuration options
# }

provider "azurerm" {
    version = "~>2.0"
    features {}

}
 
# resource "azurerm_subscription" "db" {
#   # alias             = "examplesub"
#   subscription_name = "MV - VS Enterprise Subscription – MPN"
#   subscription_id   = "29121a4b-91eb-46e3-a2b3-6c0fcebfea54"
# }

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "random_integer" "ri" {
  min = 10000
  max = 99999
}

# Cosmos db Account

resource "azurerm_cosmosdb_account" "db" {
  name                = "tfex-cosmos-db-${random_integer.ri.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  offer_type          = "Standard"
  #   kind                = "MongoDB"

  enable_automatic_failover = true

#   capabilities {
#     name = "EnableAggregationPipeline"
#   }

#   capabilities {
#     name = "mongoEnableDocLevelTTL"
#   }

#   capabilities {
#     name = "MongoDBv3.4"
#   }

#   capabilities {
#     name = "EnableMongo"
#   }

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }

  # geo_location {
  #   location          = var.failover_location
  #   failover_priority = 1
  # }

  geo_location {
    location          = azurerm_resource_group.rg.location
    failover_priority = 0
  }
}


# Cosmos Db sql Database


resource "azurerm_cosmosdb_sql_database" "db" {
  name                = "cosmos_sqldb_432"
  resource_group_name = azurerm_resource_group.rg.name
  account_name        = azurerm_cosmosdb_account.db.name
  throughput          = 400
}


# Cosmos db Sql Container

resource "azurerm_cosmosdb_sql_container" "db" {
  name                  = "cosmosdb_container_432"
  resource_group_name   = azurerm_resource_group.rg.name
  account_name          = azurerm_cosmosdb_account.db.name
  database_name         = azurerm_cosmosdb_sql_database.db.name
  partition_key_path    = "/definition/id"
  # partition_key_version = 1
  throughput            = 400

  # indexing_policy {
  #   indexing_mode = "Consistent"

  #   included_path {
  #     path = "/*"
  #   }

  #   included_path {
  #     path = "/included/?"
  #   }

  #   excluded_path {
  #     path = "/excluded/?"
  #   }
  # }

  unique_key {
    paths = ["/definition/idlong", "/definition/idshort"]
  }
}

