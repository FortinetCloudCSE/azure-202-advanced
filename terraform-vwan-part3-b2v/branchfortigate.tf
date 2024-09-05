resource "azurerm_virtual_machine" "fgtvm" {
  for_each                     = data.azurerm_resource_group.resource_group
  zones                        = [1]
  name                         = "FortiGate-Branch-VM"
  location                     = each.value.location
  resource_group_name          = each.value.name
  network_interface_ids        = [azurerm_network_interface.fgtport1[each.key].id, azurerm_network_interface.fgtport2[each.key].id]
  primary_network_interface_id = azurerm_network_interface.fgtport1[each.key].id
  vm_size                      = var.size

  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = var.publisher
    offer     = var.fgtoffer
    sku       = var.fgtsku
    version   = var.fgtversion
  }

  plan {
    name      = var.fgtsku
    publisher = var.publisher
    product   = var.fgtoffer
  }

  storage_os_disk {
    name              = "fgtvmosdisk"
    caching           = "ReadWrite"
    managed_disk_type = "Standard_LRS"
    create_option     = "FromImage"
  }

  # Log data disks
  storage_data_disk {
    name              = "fgtvmdatadisk"
    managed_disk_type = "Standard_LRS"
    create_option     = "Empty"
    lun               = 0
    disk_size_gb      = "30"
  }

  os_profile {
    computer_name  = "FortiGate-Branch-VM"
    admin_username = var.adminusername
    admin_password = var.adminpassword

  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  boot_diagnostics {
    enabled     = true
    storage_uri = ""
  }
}