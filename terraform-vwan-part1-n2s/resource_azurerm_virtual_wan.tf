resource "azurerm_virtual_wan" "virtual_vwan" {
  for_each = local.virtual_wan_maps

  resource_group_name = each.value.resource_group_name
  location            = local.location

  name = each.value.name
}

output "virtual_wans" {
  value = var.enable_module_output ? azurerm_virtual_wan.virtual_vwan : null
}