resource "azurerm_network_interface" "linuxvm-hub1spoke1-nic1" {
  for_each            = data.azurerm_resource_group.resource_group
  name                = "Linux-Spoke1_nic1"
  location            = each.value.location
  resource_group_name = each.value.name

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = azurerm_subnet.hub1spoke1-subnet1[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "linuxvm-hub1-spoke1" {
  for_each            = data.azurerm_resource_group.resource_group
  name                = "Linux-Spoke1-VM"
  resource_group_name = each.value.name
  location            = each.value.location
  size                = "Standard_F2"
  admin_username      = var.adminusername
  network_interface_ids = [
    azurerm_network_interface.linuxvm-hub1spoke1-nic1[each.key].id,
  ]

  admin_password = var.adminpassword

  os_disk {
    name                 = "Linux-Spoke1-VM-OS-Disk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }

  boot_diagnostics {
    storage_account_uri = ""
  }

  disable_password_authentication = false
}