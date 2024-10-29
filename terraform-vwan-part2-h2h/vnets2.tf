resource "azurerm_virtual_network" "hub2spoke1-vnet" {
  for_each            = data.azurerm_resource_group.resourcegroup
  name                = "Spoke3-vHub2_VNET"
  location            = "westus"
  resource_group_name = each.value.name
  address_space       = ["192.168.3.0/24"]
}

resource "azurerm_subnet" "hub2spoke3-subnet1" {
  for_each             = data.azurerm_resource_group.resourcegroup
  name                 = "Subnet1-vHub2-Spoke3_SUBNET"
  resource_group_name  = each.value.name
  virtual_network_name = azurerm_virtual_network.hub2spoke1-vnet[each.key].name
  address_prefixes     = ["192.168.3.0/24"]

}
