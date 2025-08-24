resource "azurerm_mssql_database" "mssql_database" {
name = var.db_name
server_id = var.server_id
sku_name = "S1"
max_size_gb = 10
zone_redundant = false
tags = var.tags
}
