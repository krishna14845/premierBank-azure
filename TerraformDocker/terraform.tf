terraform{
  #required_version =  ">= 0.11"
  backend "azurerm"{
    storage_account_name = "__terraformstorageaccount__"
    container_name       = "terraform" 
    key                  = "terraform.tfstate"
    access_key           = "__storagekey__"
    features{}
  }
} 

provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.3.0"
    }
  }
}

resource "azurerm_resource_group" "aks-rg" {
  name     = "__rgaks__"
  location = "__location__"
}

resource "azurerm_role_assignment" "role_acrpull" {
  scope                            = "${azurerm_container_registry.acr.id}"
  role_definition_name             = "AcrPull"
  principal_id                     = "${azurerm_kubernetes_cluster.aks.kubelet_identity.0.object_id}"
  skip_service_principal_aad_check = true
}

resource "azurerm_container_registry" "acr" {
  name                = "__acr-name__"
  resource_group_name = "${azurerm_resource_group.aks-rg.name}"
  location            = "${azurerm_resource_group.aks-rg.location}"
  sku                 = "Standard"
  admin_enabled       = false
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "__cluster-name__"
  kubernetes_version  = "__kubernetes-version__"
  location            = "${azurerm_resource_group.aks-rg.location}"
  resource_group_name = "${azurerm_resource_group.aks-rg.name}"
  dns_prefix          = "${azurerm_resource_group.aks.name}"

  default_node_pool {
    name                = "system"
    node_count          = "__system-node-count__"
    vm_size             = "Standard_DS2_v2"
    type                = "VirtualMachineScaleSets"
    availability_zones  = [1, 2, 3]
    enable_auto_scaling = false
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    load_balancer_sku = "Standard"
    network_plugin    = "kubenet" 
  }
}


output "aks_id" {
  value = azurerm_kubernetes_cluster.aks.id
}

output "aks_fqdn" {
  value = azurerm_kubernetes_cluster.aks.fqdn
}

output "aks_node_rg" {
  value = azurerm_kubernetes_cluster.aks.node_resource_group
}

output "acr_id" {
  value = azurerm_container_registry.acr.id
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

resource "local_file" "kubeconfig" {
  depends_on   = [azurerm_kubernetes_cluster.aks]
  filename     = "kubeconfig"
  content      = azurerm_kubernetes_cluster.aks.kube_config_raw
}