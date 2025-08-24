resource "azurerm_mssql_server" "mssql_server" {
  name                         = var.server_name
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.username
  administrator_login_password = var.password
  minimum_tls_version          = "1.2"
  tags = var.tags
}

output "serverid" {

 value = azurerm_mssql_server.mssql_server.id
}
