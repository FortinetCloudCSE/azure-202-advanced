resource "azurerm_virtual_hub" "virtual_hub" {
  for_each = local.virtual_hub_maps

  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  name           = each.value.name
  address_prefix = each.value.address_prefix
  virtual_wan_id = azurerm_virtual_wan.virtual_vwan[each.value.resource_group_name].id
}

output "virtual_hubs" {
  value = var.enable_module_output ? azurerm_virtual_hub.virtual_hub : null
}
