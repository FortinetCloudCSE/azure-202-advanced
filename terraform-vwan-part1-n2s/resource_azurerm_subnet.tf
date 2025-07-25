resource "azurerm_subnet" "subnet" {
  for_each = local.subnet_maps

  resource_group_name = each.value.resource_group_name

  name                 = each.value.name
  address_prefixes     = each.value.address_prefixes
  virtual_network_name = each.value.virtual_network_name
}

output "subnets" {
  value = var.enable_module_output ? azurerm_subnet.subnet : null
}
  