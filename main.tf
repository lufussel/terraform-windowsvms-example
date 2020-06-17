# Deploy resource groups

resource "azurerm_resource_group" "windows_vm_rg" {
  name     = "${var.env}-${var.app_name}-vms-rg"
  location = var.location
  tags     = var.tags
}

# Deploy network interface

resource "azurerm_network_interface" "windows_vm_nic" {
  name                = "${var.name}-nic"
  location            = var.location
  resource_group_name = azurerm_resource_group.windows_vm_rg.name

  ip_configuration {
    name                          = "${var.name}-ip-config"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
    private_ip_address            = var.private_ip_address
  }
}

resource "azurerm_windows_virtual_machine" "windows_vm" {
  name                = var.name
  resource_group_name = azurerm_resource_group.windows_vm_rg.name
  location            = var.location
  size                = var.size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.windows_vm_nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}