data "azurerm_virtual_wan" "vwan_existing" {
  for_each            = data.azurerm_resource_group.resourcegroup
  name                = "${each.key}-${each.value.location}_VWAN"
  resource_group_name = each.value.name
}


resource "azurerm_virtual_hub" "vhub2" {
  for_each            = data.azurerm_resource_group.resourcegroup
  name                = "${each.key}-vHub1_${each.value.location}"
  resource_group_name = each.value.name
  location            = "westus"
  virtual_wan_id      = data.azurerm_virtual_wan.vwan_existing[each.key].id
  address_prefix      = "10.2.0.0/16"
}

