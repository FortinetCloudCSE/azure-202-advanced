resource "azurerm_linux_virtual_machine" "linux_virtual_machine" {
  for_each = local.linux_virtual_machine_maps

  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  name = each.value.name

  size           = local.linux_vm_image["size"]
  admin_username = local.admin_username
  admin_password = local.admin_password

  network_interface_ids = [
    azurerm_network_interface.network_interface[each.key].id,
  ]

  os_disk {
    name                 = each.value.os_disk_name
    caching              = each.value.os_disk_caching
    storage_account_type = each.value.os_disk_storage_account_type
  }

  source_image_reference {
    publisher = local.linux_vm_image["publisher"]
    offer     = local.linux_vm_image["offer"]
    sku       = local.linux_vm_image["sku"]
    version   = local.linux_vm_image["version"]
  }

  boot_diagnostics {
    storage_account_uri = ""
  }

  custom_data = base64encode(
        templatefile("${path.module}/linux_virtual_machine.tpl", {
          hostname = each.value.name
        })
    )

  disable_password_authentication = false
}

output "linux_virtual_machines" {
  value     = var.enable_module_output ? azurerm_linux_virtual_machine.linux_virtual_machine : null
  sensitive = true
}
