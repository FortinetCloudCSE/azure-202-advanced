locals {
  # Resource Groups must already exist
  resource_group_names  = toset(["vwan12", "vwan13"])
  resource_group_suffix = "-training"
  location              = "eastus"

  admin_username = "fortixperts"
  admin_password = "Fortixperts2024!"

  # Create a map of virtual WANs from Resource Groups
  virtual_wan_maps = {
    for item in local.resource_group_names :
    format("%s%s", item, local.resource_group_suffix) => {
      resource_group_name = format("%s%s", item, local.resource_group_suffix),
      location            = local.location,
      name                = format("%s%s%s", item, local.resource_group_suffix, "_VWAN")
    }
  }

  # Create a map of virtual hubs from Resource Groups and desired Hub count
  virtual_hub_list = setproduct(local.resource_group_names, ["1"])
  virtual_hub_maps = {
    for item in local.virtual_hub_list :
    format("%s%s-%s", item[0], local.resource_group_suffix, item[1]) => {
      resource_group_name = format("%s%s", item[0], local.resource_group_suffix),
      location            = local.location,
      name                = format("%s%s%s%s%s%s", item[0], "-", local.location, "-vHub", item[1], "_VHUB"),
      address_prefix      = format("%s%s%s", "10.", item[1], ".0.0/16"),
      virtual_wan_id      = azurerm_virtual_wan.virtual_vwan[format("%s%s", item[0], local.resource_group_suffix)].id,
    }
  }

  # Create a map of virtual networks from Resource Groups and desired VNet count
  virtual_network_list = setproduct(local.resource_group_names, ["1", "2"])
  virtual_network_maps = {
    for item in local.virtual_network_list :
    format("%s%s-%s", item[0], local.resource_group_suffix, item[1]) => {
      resource_group_name = format("%s%s", item[0], local.resource_group_suffix),
      location            = local.location,
      name                = format("%s%s%s", "Spoke", item[1], "-vHub1_VNET"),
      address_space       = [format("192.168.%s.0/24", item[1])]
    }
  }

  # Create a map of subnets from Resource Groups and desired Subnet count
  subnet_list = setproduct(local.resource_group_names, ["1", "2"])
  subnet_maps = {
    for item in local.subnet_list :
    format("%s%s-%s", item[0], local.resource_group_suffix, item[1]) => {
      resource_group_name  = format("%s%s", item[0], local.resource_group_suffix),
      location             = local.location,
      name                 = format("%s%s%s", "Spoke", item[1], "-vhub1_SUBNET"),
      address_prefixes     = [format("192.168.%s.0/24", item[1])],
      virtual_network_name = azurerm_virtual_network.virtual_network[format("%s%s-%s", item[0], local.resource_group_suffix, item[1])].name
    }
  }

  # Create a map of linux VM Nics from Resource Groups and desired VM Nic count
  network_interface_list = setproduct(local.resource_group_names, ["1", "2"])
  network_interface_maps = {
    for item in local.network_interface_list :
    format("%s%s-%s", item[0], local.resource_group_suffix, item[1]) => {
      resource_group_name = format("%s%s", item[0], local.resource_group_suffix),
      location            = local.location,
      name                = format("%s%s%s", "Linux-Spoke", item[1], "-VM_nic1")
    }
  }

  # Create a map of linux VMs from Resource Groups and desired VM count
  linux_virtual_machine_list = setproduct(local.resource_group_names, ["1", "2"])
  linux_virtual_machine_maps = {
    for item in local.linux_virtual_machine_list :
    format("%s%s-%s", item[0], local.resource_group_suffix, item[1]) => {
      resource_group_name          = format("%s%s", item[0], local.resource_group_suffix),
      location                     = local.location,
      name                         = format("%s%s%s", "Linux-Spoke", item[1], "-VM"),
      os_disk_name                 = format("%s%s%s", "Linux-Spoke", item[1], "-VM-OS-Disk"),
      os_disk_caching              = "ReadWrite"
      os_disk_storage_account_type = "Standard_LRS"
    }
  }

  # Linux VM Image and Size
  linux_vm_image = {
    size      = "Standard_F2"
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}

output "virtual_wan_maps" {
  value = var.enable_module_output ? local.virtual_wan_maps : null
}

output "virtual_hub_list" {
  value = var.enable_module_output ? local.virtual_hub_list : null
}

output "virtual_hub_maps" {
  value = var.enable_module_output ? local.virtual_hub_maps : null
}

output "virtual_network_list" {
  value = var.enable_module_output ? local.virtual_network_list : null
}

output "virtual_network_maps" {
  value = var.enable_module_output ? local.virtual_network_maps : null
}

output "subnet_list" {
  value = var.enable_module_output ? local.subnet_list : null
}

output "subnet_maps" {
  value = var.enable_module_output ? local.subnet_maps : null
}

output "network_interface_list" {
  value = var.enable_module_output ? local.network_interface_list : null
}

output "network_interface_maps" {
  value = var.enable_module_output ? local.network_interface_maps : null
}

output "linux_virtual_machine_list" {
  value = var.enable_module_output ? local.linux_virtual_machine_list : null
}

output "linux_virtual_machine_maps" {
  value = var.enable_module_output ? local.linux_virtual_machine_maps : null
}
