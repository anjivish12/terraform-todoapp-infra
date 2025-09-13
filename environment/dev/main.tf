module "rg" {
  source   = "../../modules/azurerm_resource_group"
  rg_name  = "rg-moon"
  location = "East US"
  tags = {
    env  = "dev"
    name = "rg"
  }
}

module "rg1" {
  source   = "../../modules/azurerm_resource_group"
  rg_name  = "rg-moon-1"
  location = "East US"
  tags = {
    env  = "dev"
    name = "rg"
  }
}

module "stg" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_storage_account"
  stg_name   = "moonstg12"
  rg_name    = "rg-moon"
  location   = "East US"
  tags = {
    env  = "dev"
    name = "stg"
  }
}
module "server" {
  depends_on  = [module.rg]
  source      = "../../modules/azurerm_sql_server"
  server_name = "moonserver12"
  rg_name     = "rg-moon"
  location    = "UK South"
  username    = "anjaliserver"
  password    = "Anjali@12345"
  tags = {
    env  = "dev"
    name = "server"
  }
}
module "database" {
  depends_on = [module.server]
  source     = "../../modules/azurerm_sql_db"
  db_name    = "moondb"
  server_id  = module.server.serverid
  tags = {
    env  = "dev"
    name = "db"
  }
}

module "kv" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_key_vault"
  kv_name    = "moonkv12"
  location   = "East US"
  rg_name    = "rg-moon"
  tags = {
    env  = "dev"
    name = "kv"
  }
}
module "aks" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_aks"
  aks_name   = "moonaks12"
  location   = "East US"
  rg_name    = "rg-moon"
  dns_prefix = "dns-moon"
  vm_size = "standard_a2_v2"
  tags = {
    env  = "dev"
    name = "aks"
  }

}

module "acr" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_container_registry"
  acr_name   = "moonacr"
  rg_name    = "rg-moon"
  location   = "East US"
  tags = {
    env  = "dev"
    name = "acr"
  }
}