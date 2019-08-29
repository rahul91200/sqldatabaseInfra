resource "azurerm_resource_group" "test" {
  name     = "acceptanceTestResourceGroup1"
  location = "West US"
}

resource "azurerm_sql_server" "test" {
  name                         = "mysqlserver"
  resource_group_name          = "${azurerm_resource_group.test.name}"
  location                     = "West US"
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}

resource "azurerm_sql_database" "test" {
  name                = "mysqldatabase"
  resource_group_name = "${azurerm_resource_group.test.name}"
  location            = "West US"
  server_name         = "${azurerm_sql_server.test.name}"

  tags = {
    environment = "production"
  }
}


-------------------------------------------------------------------------------------------------


#refer to a existing resource group
data "azurerm_resource_group" "test" {
  name     = "rahul_RG"
#  location = "West US"
}

resource "azurerm_sql_server" "test" {
  name                         = "mysqlserverrahull"
  resource_group_name          = "${data.azurerm_resource_group.test.name}"
  location                     = "West US"
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
  tags = {
	environment = "demooo"
  }
}

resource "azurerm_sql_database" "test" {
  name                = "mysqldatabaserahull"
  resource_group_name = "${data.azurerm_resource_group.test.name}"
  location            = "West US"
  server_name         = "${azurerm_sql_server.test.name}"
  create_mode         = "Default"
  edition             = "Basic"

  tags = {
    environment = "demooo"
  }
}

