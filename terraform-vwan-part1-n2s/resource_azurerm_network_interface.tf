resource "azurerm_network_interface" "network_interface" {
  for_each = local.network_interface_maps

  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  name = each.value.name

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

output "network_interfaces" {
  value = var.enable_module_output ? azurerm_network_interface.network_interface : null
}
