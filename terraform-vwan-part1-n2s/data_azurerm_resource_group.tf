data "azurerm_resource_group" "resource_group" {
  for_each = local.resource_group_names

  name = "${each.value}${local.resource_group_suffix}"
}
